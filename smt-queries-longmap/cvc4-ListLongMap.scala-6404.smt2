; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82224 () Bool)

(assert start!82224)

(declare-fun b_free!18497 () Bool)

(declare-fun b_next!18497 () Bool)

(assert (=> start!82224 (= b_free!18497 (not b_next!18497))))

(declare-fun tp!64451 () Bool)

(declare-fun b_and!29985 () Bool)

(assert (=> start!82224 (= tp!64451 b_and!29985)))

(declare-fun mapNonEmpty!33784 () Bool)

(declare-fun mapRes!33784 () Bool)

(declare-fun tp!64452 () Bool)

(declare-fun e!540300 () Bool)

(assert (=> mapNonEmpty!33784 (= mapRes!33784 (and tp!64452 e!540300))))

(declare-datatypes ((V!33253 0))(
  ( (V!33254 (val!10652 Int)) )
))
(declare-datatypes ((ValueCell!10120 0))(
  ( (ValueCellFull!10120 (v!13209 V!33253)) (EmptyCell!10120) )
))
(declare-fun mapRest!33784 () (Array (_ BitVec 32) ValueCell!10120))

(declare-fun mapKey!33784 () (_ BitVec 32))

(declare-datatypes ((array!58507 0))(
  ( (array!58508 (arr!28127 (Array (_ BitVec 32) ValueCell!10120)) (size!28606 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58507)

(declare-fun mapValue!33784 () ValueCell!10120)

(assert (=> mapNonEmpty!33784 (= (arr!28127 _values!1386) (store mapRest!33784 mapKey!33784 mapValue!33784))))

(declare-fun b!958388 () Bool)

(declare-fun res!641513 () Bool)

(declare-fun e!540296 () Bool)

(assert (=> b!958388 (=> (not res!641513) (not e!540296))))

(declare-datatypes ((array!58509 0))(
  ( (array!58510 (arr!28128 (Array (_ BitVec 32) (_ BitVec 64))) (size!28607 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58509)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958388 (= res!641513 (validKeyInArray!0 (select (arr!28128 _keys!1668) i!793)))))

(declare-fun b!958389 () Bool)

(declare-fun res!641511 () Bool)

(assert (=> b!958389 (=> (not res!641511) (not e!540296))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58509 (_ BitVec 32)) Bool)

(assert (=> b!958389 (= res!641511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958390 () Bool)

(declare-fun tp_is_empty!21203 () Bool)

(assert (=> b!958390 (= e!540300 tp_is_empty!21203)))

(declare-fun b!958391 () Bool)

(declare-fun e!540297 () Bool)

(declare-fun e!540299 () Bool)

(assert (=> b!958391 (= e!540297 (and e!540299 mapRes!33784))))

(declare-fun condMapEmpty!33784 () Bool)

(declare-fun mapDefault!33784 () ValueCell!10120)

