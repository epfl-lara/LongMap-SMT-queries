; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40972 () Bool)

(assert start!40972)

(declare-fun b_free!10907 () Bool)

(declare-fun b_next!10907 () Bool)

(assert (=> start!40972 (= b_free!10907 (not b_next!10907))))

(declare-fun tp!38548 () Bool)

(declare-fun b_and!19049 () Bool)

(assert (=> start!40972 (= tp!38548 b_and!19049)))

(declare-fun b!456032 () Bool)

(declare-fun res!272042 () Bool)

(declare-fun e!266520 () Bool)

(assert (=> b!456032 (=> (not res!272042) (not e!266520))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456032 (= res!272042 (validKeyInArray!0 k!794))))

(declare-fun b!456033 () Bool)

(declare-fun res!272045 () Bool)

(assert (=> b!456033 (=> (not res!272045) (not e!266520))))

(declare-datatypes ((array!28293 0))(
  ( (array!28294 (arr!13590 (Array (_ BitVec 32) (_ BitVec 64))) (size!13942 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28293)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17431 0))(
  ( (V!17432 (val!6167 Int)) )
))
(declare-datatypes ((ValueCell!5779 0))(
  ( (ValueCellFull!5779 (v!8433 V!17431)) (EmptyCell!5779) )
))
(declare-datatypes ((array!28295 0))(
  ( (array!28296 (arr!13591 (Array (_ BitVec 32) ValueCell!5779)) (size!13943 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28295)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!456033 (= res!272045 (and (= (size!13943 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13942 _keys!709) (size!13943 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456034 () Bool)

(declare-fun res!272040 () Bool)

(assert (=> b!456034 (=> (not res!272040) (not e!266520))))

(declare-datatypes ((List!8196 0))(
  ( (Nil!8193) (Cons!8192 (h!9048 (_ BitVec 64)) (t!14024 List!8196)) )
))
(declare-fun arrayNoDuplicates!0 (array!28293 (_ BitVec 32) List!8196) Bool)

(assert (=> b!456034 (= res!272040 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8193))))

(declare-fun b!456035 () Bool)

(declare-fun res!272044 () Bool)

(declare-fun e!266521 () Bool)

(assert (=> b!456035 (=> (not res!272044) (not e!266521))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456035 (= res!272044 (bvsle from!863 i!563))))

(declare-fun b!456036 () Bool)

(declare-fun res!272043 () Bool)

(assert (=> b!456036 (=> (not res!272043) (not e!266520))))

(assert (=> b!456036 (= res!272043 (or (= (select (arr!13590 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13590 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456037 () Bool)

(declare-fun e!266516 () Bool)

(declare-fun e!266518 () Bool)

(declare-fun mapRes!20008 () Bool)

(assert (=> b!456037 (= e!266516 (and e!266518 mapRes!20008))))

(declare-fun condMapEmpty!20008 () Bool)

(declare-fun mapDefault!20008 () ValueCell!5779)

