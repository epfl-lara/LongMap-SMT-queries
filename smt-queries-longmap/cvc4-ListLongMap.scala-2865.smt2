; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41250 () Bool)

(assert start!41250)

(declare-fun b_free!11093 () Bool)

(declare-fun b_next!11093 () Bool)

(assert (=> start!41250 (= b_free!11093 (not b_next!11093))))

(declare-fun tp!39117 () Bool)

(declare-fun b_and!19413 () Bool)

(assert (=> start!41250 (= tp!39117 b_and!19413)))

(declare-fun b!461637 () Bool)

(declare-fun res!276183 () Bool)

(declare-fun e!269207 () Bool)

(assert (=> b!461637 (=> (not res!276183) (not e!269207))))

(declare-datatypes ((array!28661 0))(
  ( (array!28662 (arr!13770 (Array (_ BitVec 32) (_ BitVec 64))) (size!14122 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28661)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461637 (= res!276183 (or (= (select (arr!13770 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13770 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461638 () Bool)

(declare-fun res!276187 () Bool)

(declare-fun e!269208 () Bool)

(assert (=> b!461638 (=> (not res!276187) (not e!269208))))

(declare-fun lt!209061 () array!28661)

(declare-datatypes ((List!8332 0))(
  ( (Nil!8329) (Cons!8328 (h!9184 (_ BitVec 64)) (t!14274 List!8332)) )
))
(declare-fun arrayNoDuplicates!0 (array!28661 (_ BitVec 32) List!8332) Bool)

(assert (=> b!461638 (= res!276187 (arrayNoDuplicates!0 lt!209061 #b00000000000000000000000000000000 Nil!8329))))

(declare-fun b!461639 () Bool)

(declare-fun res!276191 () Bool)

(assert (=> b!461639 (=> (not res!276191) (not e!269207))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28661 (_ BitVec 32)) Bool)

(assert (=> b!461639 (= res!276191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!461640 () Bool)

(declare-fun res!276189 () Bool)

(assert (=> b!461640 (=> (not res!276189) (not e!269208))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!461640 (= res!276189 (bvsle from!863 i!563))))

(declare-fun b!461641 () Bool)

(declare-fun res!276188 () Bool)

(assert (=> b!461641 (=> (not res!276188) (not e!269207))))

(assert (=> b!461641 (= res!276188 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8329))))

(declare-fun b!461642 () Bool)

(declare-fun res!276184 () Bool)

(assert (=> b!461642 (=> (not res!276184) (not e!269207))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461642 (= res!276184 (validKeyInArray!0 k!794))))

(declare-fun b!461643 () Bool)

(declare-fun e!269205 () Bool)

(declare-fun e!269210 () Bool)

(declare-fun mapRes!20299 () Bool)

(assert (=> b!461643 (= e!269205 (and e!269210 mapRes!20299))))

(declare-fun condMapEmpty!20299 () Bool)

(declare-datatypes ((V!17679 0))(
  ( (V!17680 (val!6260 Int)) )
))
(declare-datatypes ((ValueCell!5872 0))(
  ( (ValueCellFull!5872 (v!8542 V!17679)) (EmptyCell!5872) )
))
(declare-datatypes ((array!28663 0))(
  ( (array!28664 (arr!13771 (Array (_ BitVec 32) ValueCell!5872)) (size!14123 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28663)

(declare-fun mapDefault!20299 () ValueCell!5872)

