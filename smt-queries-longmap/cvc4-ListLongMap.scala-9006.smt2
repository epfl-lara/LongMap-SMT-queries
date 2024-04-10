; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108800 () Bool)

(assert start!108800)

(declare-fun b_free!28313 () Bool)

(declare-fun b_next!28313 () Bool)

(assert (=> start!108800 (= b_free!28313 (not b_next!28313))))

(declare-fun tp!100054 () Bool)

(declare-fun b_and!46379 () Bool)

(assert (=> start!108800 (= tp!100054 b_and!46379)))

(declare-fun mapNonEmpty!52487 () Bool)

(declare-fun mapRes!52487 () Bool)

(declare-fun tp!100055 () Bool)

(declare-fun e!733910 () Bool)

(assert (=> mapNonEmpty!52487 (= mapRes!52487 (and tp!100055 e!733910))))

(declare-datatypes ((V!50373 0))(
  ( (V!50374 (val!17051 Int)) )
))
(declare-datatypes ((ValueCell!16078 0))(
  ( (ValueCellFull!16078 (v!19653 V!50373)) (EmptyCell!16078) )
))
(declare-fun mapRest!52487 () (Array (_ BitVec 32) ValueCell!16078))

(declare-fun mapValue!52487 () ValueCell!16078)

(declare-datatypes ((array!84964 0))(
  ( (array!84965 (arr!40984 (Array (_ BitVec 32) ValueCell!16078)) (size!41534 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84964)

(declare-fun mapKey!52487 () (_ BitVec 32))

(assert (=> mapNonEmpty!52487 (= (arr!40984 _values!1445) (store mapRest!52487 mapKey!52487 mapValue!52487))))

(declare-fun mapIsEmpty!52487 () Bool)

(assert (=> mapIsEmpty!52487 mapRes!52487))

(declare-fun b!1284788 () Bool)

(declare-fun res!853491 () Bool)

(declare-fun e!733908 () Bool)

(assert (=> b!1284788 (=> (not res!853491) (not e!733908))))

(declare-datatypes ((array!84966 0))(
  ( (array!84967 (arr!40985 (Array (_ BitVec 32) (_ BitVec 64))) (size!41535 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84966)

(declare-datatypes ((List!29042 0))(
  ( (Nil!29039) (Cons!29038 (h!30247 (_ BitVec 64)) (t!42586 List!29042)) )
))
(declare-fun arrayNoDuplicates!0 (array!84966 (_ BitVec 32) List!29042) Bool)

(assert (=> b!1284788 (= res!853491 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29039))))

(declare-fun res!853487 () Bool)

(assert (=> start!108800 (=> (not res!853487) (not e!733908))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108800 (= res!853487 (validMask!0 mask!2175))))

(assert (=> start!108800 e!733908))

(declare-fun tp_is_empty!33953 () Bool)

(assert (=> start!108800 tp_is_empty!33953))

(assert (=> start!108800 true))

(declare-fun e!733906 () Bool)

(declare-fun array_inv!31085 (array!84964) Bool)

(assert (=> start!108800 (and (array_inv!31085 _values!1445) e!733906)))

(declare-fun array_inv!31086 (array!84966) Bool)

(assert (=> start!108800 (array_inv!31086 _keys!1741)))

(assert (=> start!108800 tp!100054))

(declare-fun b!1284789 () Bool)

(assert (=> b!1284789 (= e!733910 tp_is_empty!33953)))

(declare-fun b!1284790 () Bool)

(declare-fun res!853488 () Bool)

(assert (=> b!1284790 (=> (not res!853488) (not e!733908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84966 (_ BitVec 32)) Bool)

(assert (=> b!1284790 (= res!853488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284791 () Bool)

(declare-fun e!733909 () Bool)

(assert (=> b!1284791 (= e!733909 tp_is_empty!33953)))

(declare-fun b!1284792 () Bool)

(assert (=> b!1284792 (= e!733906 (and e!733909 mapRes!52487))))

(declare-fun condMapEmpty!52487 () Bool)

(declare-fun mapDefault!52487 () ValueCell!16078)

