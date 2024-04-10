; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!616 () Bool)

(assert start!616)

(declare-fun b_free!89 () Bool)

(declare-fun b_next!89 () Bool)

(assert (=> start!616 (= b_free!89 (not b_next!89))))

(declare-fun tp!485 () Bool)

(declare-fun b_and!227 () Bool)

(assert (=> start!616 (= tp!485 b_and!227)))

(declare-fun mapNonEmpty!209 () Bool)

(declare-fun mapRes!209 () Bool)

(declare-fun tp!484 () Bool)

(declare-fun e!1968 () Bool)

(assert (=> mapNonEmpty!209 (= mapRes!209 (and tp!484 e!1968))))

(declare-datatypes ((V!399 0))(
  ( (V!400 (val!89 Int)) )
))
(declare-datatypes ((ValueCell!67 0))(
  ( (ValueCellFull!67 (v!1176 V!399)) (EmptyCell!67) )
))
(declare-datatypes ((array!269 0))(
  ( (array!270 (arr!127 (Array (_ BitVec 32) ValueCell!67)) (size!189 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!269)

(declare-fun mapRest!209 () (Array (_ BitVec 32) ValueCell!67))

(declare-fun mapKey!209 () (_ BitVec 32))

(declare-fun mapValue!209 () ValueCell!67)

(assert (=> mapNonEmpty!209 (= (arr!127 _values!1492) (store mapRest!209 mapKey!209 mapValue!209))))

(declare-fun b!3868 () Bool)

(declare-fun tp_is_empty!167 () Bool)

(assert (=> b!3868 (= e!1968 tp_is_empty!167)))

(declare-fun res!5415 () Bool)

(declare-fun e!1970 () Bool)

(assert (=> start!616 (=> (not res!5415) (not e!1970))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!616 (= res!5415 (validMask!0 mask!2250))))

(assert (=> start!616 e!1970))

(assert (=> start!616 tp!485))

(assert (=> start!616 true))

(declare-fun e!1969 () Bool)

(declare-fun array_inv!91 (array!269) Bool)

(assert (=> start!616 (and (array_inv!91 _values!1492) e!1969)))

(assert (=> start!616 tp_is_empty!167))

(declare-datatypes ((array!271 0))(
  ( (array!272 (arr!128 (Array (_ BitVec 32) (_ BitVec 64))) (size!190 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!271)

(declare-fun array_inv!92 (array!271) Bool)

(assert (=> start!616 (array_inv!92 _keys!1806)))

(declare-fun mapIsEmpty!209 () Bool)

(assert (=> mapIsEmpty!209 mapRes!209))

(declare-fun b!3869 () Bool)

(declare-fun res!5414 () Bool)

(assert (=> b!3869 (=> (not res!5414) (not e!1970))))

(declare-datatypes ((List!75 0))(
  ( (Nil!72) (Cons!71 (h!637 (_ BitVec 64)) (t!2202 List!75)) )
))
(declare-fun arrayNoDuplicates!0 (array!271 (_ BitVec 32) List!75) Bool)

(assert (=> b!3869 (= res!5414 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!72))))

(declare-fun b!3870 () Bool)

(declare-fun res!5416 () Bool)

(assert (=> b!3870 (=> (not res!5416) (not e!1970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!271 (_ BitVec 32)) Bool)

(assert (=> b!3870 (= res!5416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3871 () Bool)

(assert (=> b!3871 (= e!1970 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!534 () Bool)

(declare-fun minValue!1434 () V!399)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!399)

(declare-datatypes ((tuple2!64 0))(
  ( (tuple2!65 (_1!32 (_ BitVec 64)) (_2!32 V!399)) )
))
(declare-datatypes ((List!76 0))(
  ( (Nil!73) (Cons!72 (h!638 tuple2!64) (t!2203 List!76)) )
))
(declare-datatypes ((ListLongMap!69 0))(
  ( (ListLongMap!70 (toList!50 List!76)) )
))
(declare-fun contains!20 (ListLongMap!69 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!9 (array!271 array!269 (_ BitVec 32) (_ BitVec 32) V!399 V!399 (_ BitVec 32) Int) ListLongMap!69)

(assert (=> b!3871 (= lt!534 (contains!20 (getCurrentListMap!9 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!3872 () Bool)

(declare-fun e!1967 () Bool)

(assert (=> b!3872 (= e!1969 (and e!1967 mapRes!209))))

(declare-fun condMapEmpty!209 () Bool)

(declare-fun mapDefault!209 () ValueCell!67)

