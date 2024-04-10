; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101528 () Bool)

(assert start!101528)

(declare-fun b_free!26315 () Bool)

(declare-fun b_next!26315 () Bool)

(assert (=> start!101528 (= b_free!26315 (not b_next!26315))))

(declare-fun tp!91981 () Bool)

(declare-fun b_and!43837 () Bool)

(assert (=> start!101528 (= tp!91981 b_and!43837)))

(declare-fun mapNonEmpty!48418 () Bool)

(declare-fun mapRes!48418 () Bool)

(declare-fun tp!91982 () Bool)

(declare-fun e!693139 () Bool)

(assert (=> mapNonEmpty!48418 (= mapRes!48418 (and tp!91982 e!693139))))

(declare-datatypes ((V!46485 0))(
  ( (V!46486 (val!15566 Int)) )
))
(declare-datatypes ((ValueCell!14800 0))(
  ( (ValueCellFull!14800 (v!18224 V!46485)) (EmptyCell!14800) )
))
(declare-fun mapValue!48418 () ValueCell!14800)

(declare-fun mapKey!48418 () (_ BitVec 32))

(declare-datatypes ((array!78817 0))(
  ( (array!78818 (arr!38038 (Array (_ BitVec 32) ValueCell!14800)) (size!38574 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78817)

(declare-fun mapRest!48418 () (Array (_ BitVec 32) ValueCell!14800))

(assert (=> mapNonEmpty!48418 (= (arr!38038 _values!996) (store mapRest!48418 mapKey!48418 mapValue!48418))))

(declare-fun b!1220642 () Bool)

(declare-fun res!810852 () Bool)

(declare-fun e!693138 () Bool)

(assert (=> b!1220642 (=> (not res!810852) (not e!693138))))

(declare-datatypes ((array!78819 0))(
  ( (array!78820 (arr!38039 (Array (_ BitVec 32) (_ BitVec 64))) (size!38575 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78819)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78819 (_ BitVec 32)) Bool)

(assert (=> b!1220642 (= res!810852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220643 () Bool)

(declare-fun e!693142 () Bool)

(declare-fun tp_is_empty!31019 () Bool)

(assert (=> b!1220643 (= e!693142 tp_is_empty!31019)))

(declare-fun b!1220644 () Bool)

(declare-fun e!693141 () Bool)

(assert (=> b!1220644 (= e!693141 (and e!693142 mapRes!48418))))

(declare-fun condMapEmpty!48418 () Bool)

(declare-fun mapDefault!48418 () ValueCell!14800)

