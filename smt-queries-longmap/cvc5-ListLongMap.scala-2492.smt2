; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38770 () Bool)

(assert start!38770)

(declare-fun b!404207 () Bool)

(declare-fun res!233063 () Bool)

(declare-fun e!243208 () Bool)

(assert (=> b!404207 (=> (not res!233063) (not e!243208))))

(declare-datatypes ((array!24273 0))(
  ( (array!24274 (arr!11586 (Array (_ BitVec 32) (_ BitVec 64))) (size!11938 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24273)

(declare-datatypes ((List!6748 0))(
  ( (Nil!6745) (Cons!6744 (h!7600 (_ BitVec 64)) (t!11922 List!6748)) )
))
(declare-fun arrayNoDuplicates!0 (array!24273 (_ BitVec 32) List!6748) Bool)

(assert (=> b!404207 (= res!233063 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6745))))

(declare-fun b!404208 () Bool)

(declare-fun res!233062 () Bool)

(assert (=> b!404208 (=> (not res!233062) (not e!243208))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24273 (_ BitVec 32)) Bool)

(assert (=> b!404208 (= res!233062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404209 () Bool)

(declare-fun e!243205 () Bool)

(declare-fun e!243210 () Bool)

(declare-fun mapRes!16905 () Bool)

(assert (=> b!404209 (= e!243205 (and e!243210 mapRes!16905))))

(declare-fun condMapEmpty!16905 () Bool)

(declare-datatypes ((V!14691 0))(
  ( (V!14692 (val!5139 Int)) )
))
(declare-datatypes ((ValueCell!4751 0))(
  ( (ValueCellFull!4751 (v!7386 V!14691)) (EmptyCell!4751) )
))
(declare-datatypes ((array!24275 0))(
  ( (array!24276 (arr!11587 (Array (_ BitVec 32) ValueCell!4751)) (size!11939 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24275)

(declare-fun mapDefault!16905 () ValueCell!4751)

