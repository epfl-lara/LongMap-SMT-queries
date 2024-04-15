; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3962 () Bool)

(assert start!3962)

(declare-fun b_free!877 () Bool)

(declare-fun b_next!877 () Bool)

(assert (=> start!3962 (= b_free!877 (not b_next!877))))

(declare-fun tp!4050 () Bool)

(declare-fun b_and!1681 () Bool)

(assert (=> start!3962 (= tp!4050 b_and!1681)))

(declare-fun b!28502 () Bool)

(declare-fun e!18425 () Bool)

(declare-fun e!18423 () Bool)

(assert (=> b!28502 (= e!18425 e!18423)))

(declare-fun res!16998 () Bool)

(assert (=> b!28502 (=> (not res!16998) (not e!18423))))

(declare-datatypes ((V!1467 0))(
  ( (V!1468 (val!642 Int)) )
))
(declare-datatypes ((tuple2!1082 0))(
  ( (tuple2!1083 (_1!552 (_ BitVec 64)) (_2!552 V!1467)) )
))
(declare-datatypes ((List!666 0))(
  ( (Nil!663) (Cons!662 (h!1229 tuple2!1082) (t!3352 List!666)) )
))
(declare-datatypes ((ListLongMap!647 0))(
  ( (ListLongMap!648 (toList!339 List!666)) )
))
(declare-fun lt!10849 () ListLongMap!647)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!280 (ListLongMap!647 (_ BitVec 64)) Bool)

(assert (=> b!28502 (= res!16998 (not (contains!280 lt!10849 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1675 0))(
  ( (array!1676 (arr!791 (Array (_ BitVec 32) (_ BitVec 64))) (size!892 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1675)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((ValueCell!416 0))(
  ( (ValueCellFull!416 (v!1730 V!1467)) (EmptyCell!416) )
))
(declare-datatypes ((array!1677 0))(
  ( (array!1678 (arr!792 (Array (_ BitVec 32) ValueCell!416)) (size!893 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1677)

(declare-fun zeroValue!1443 () V!1467)

(declare-fun minValue!1443 () V!1467)

(declare-fun getCurrentListMap!168 (array!1675 array!1677 (_ BitVec 32) (_ BitVec 32) V!1467 V!1467 (_ BitVec 32) Int) ListLongMap!647)

(assert (=> b!28502 (= lt!10849 (getCurrentListMap!168 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28503 () Bool)

(declare-fun res!16999 () Bool)

(assert (=> b!28503 (=> (not res!16999) (not e!18425))))

(declare-datatypes ((List!667 0))(
  ( (Nil!664) (Cons!663 (h!1230 (_ BitVec 64)) (t!3353 List!667)) )
))
(declare-fun arrayNoDuplicates!0 (array!1675 (_ BitVec 32) List!667) Bool)

(assert (=> b!28503 (= res!16999 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!664))))

(declare-fun b!28504 () Bool)

(declare-fun res!17001 () Bool)

(assert (=> b!28504 (=> (not res!17001) (not e!18423))))

(declare-fun arrayContainsKey!0 (array!1675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28504 (= res!17001 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1375 () Bool)

(declare-fun mapRes!1375 () Bool)

(assert (=> mapIsEmpty!1375 mapRes!1375))

(declare-fun b!28505 () Bool)

(declare-fun e!18424 () Bool)

(declare-fun e!18422 () Bool)

(assert (=> b!28505 (= e!18424 (and e!18422 mapRes!1375))))

(declare-fun condMapEmpty!1375 () Bool)

(declare-fun mapDefault!1375 () ValueCell!416)

(assert (=> b!28505 (= condMapEmpty!1375 (= (arr!792 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!416)) mapDefault!1375)))))

(declare-fun b!28507 () Bool)

(declare-fun res!16995 () Bool)

(assert (=> b!28507 (=> (not res!16995) (not e!18425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1675 (_ BitVec 32)) Bool)

(assert (=> b!28507 (= res!16995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1375 () Bool)

(declare-fun tp!4051 () Bool)

(declare-fun e!18421 () Bool)

(assert (=> mapNonEmpty!1375 (= mapRes!1375 (and tp!4051 e!18421))))

(declare-fun mapRest!1375 () (Array (_ BitVec 32) ValueCell!416))

(declare-fun mapKey!1375 () (_ BitVec 32))

(declare-fun mapValue!1375 () ValueCell!416)

(assert (=> mapNonEmpty!1375 (= (arr!792 _values!1501) (store mapRest!1375 mapKey!1375 mapValue!1375))))

(declare-fun b!28508 () Bool)

(declare-fun res!16997 () Bool)

(assert (=> b!28508 (=> (not res!16997) (not e!18425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28508 (= res!16997 (validKeyInArray!0 k0!1304))))

(declare-fun b!28509 () Bool)

(declare-fun res!17000 () Bool)

(assert (=> b!28509 (=> (not res!17000) (not e!18425))))

(assert (=> b!28509 (= res!17000 (and (= (size!893 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!892 _keys!1833) (size!893 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28510 () Bool)

(declare-fun e!18426 () Bool)

(assert (=> b!28510 (= e!18426 true)))

(declare-datatypes ((SeekEntryResult!71 0))(
  ( (MissingZero!71 (index!2406 (_ BitVec 32))) (Found!71 (index!2407 (_ BitVec 32))) (Intermediate!71 (undefined!883 Bool) (index!2408 (_ BitVec 32)) (x!6333 (_ BitVec 32))) (Undefined!71) (MissingVacant!71 (index!2409 (_ BitVec 32))) )
))
(declare-fun lt!10847 () SeekEntryResult!71)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1675 (_ BitVec 32)) SeekEntryResult!71)

(assert (=> b!28510 (= lt!10847 (seekEntryOrOpen!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!28506 () Bool)

(declare-fun tp_is_empty!1231 () Bool)

(assert (=> b!28506 (= e!18422 tp_is_empty!1231)))

(declare-fun res!17002 () Bool)

(assert (=> start!3962 (=> (not res!17002) (not e!18425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3962 (= res!17002 (validMask!0 mask!2294))))

(assert (=> start!3962 e!18425))

(assert (=> start!3962 true))

(assert (=> start!3962 tp!4050))

(declare-fun array_inv!555 (array!1677) Bool)

(assert (=> start!3962 (and (array_inv!555 _values!1501) e!18424)))

(declare-fun array_inv!556 (array!1675) Bool)

(assert (=> start!3962 (array_inv!556 _keys!1833)))

(assert (=> start!3962 tp_is_empty!1231))

(declare-fun b!28511 () Bool)

(assert (=> b!28511 (= e!18423 (not e!18426))))

(declare-fun res!16996 () Bool)

(assert (=> b!28511 (=> res!16996 e!18426)))

(assert (=> b!28511 (= res!16996 (not (= (size!892 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-fun lt!10846 () (_ BitVec 32))

(assert (=> b!28511 (contains!280 lt!10849 (select (arr!791 _keys!1833) lt!10846))))

(declare-datatypes ((Unit!652 0))(
  ( (Unit!653) )
))
(declare-fun lt!10848 () Unit!652)

(declare-fun lemmaValidKeyInArrayIsInListMap!16 (array!1675 array!1677 (_ BitVec 32) (_ BitVec 32) V!1467 V!1467 (_ BitVec 32) Int) Unit!652)

(assert (=> b!28511 (= lt!10848 (lemmaValidKeyInArrayIsInListMap!16 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!10846 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1675 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28511 (= lt!10846 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28512 () Bool)

(assert (=> b!28512 (= e!18421 tp_is_empty!1231)))

(assert (= (and start!3962 res!17002) b!28509))

(assert (= (and b!28509 res!17000) b!28507))

(assert (= (and b!28507 res!16995) b!28503))

(assert (= (and b!28503 res!16999) b!28508))

(assert (= (and b!28508 res!16997) b!28502))

(assert (= (and b!28502 res!16998) b!28504))

(assert (= (and b!28504 res!17001) b!28511))

(assert (= (and b!28511 (not res!16996)) b!28510))

(assert (= (and b!28505 condMapEmpty!1375) mapIsEmpty!1375))

(assert (= (and b!28505 (not condMapEmpty!1375)) mapNonEmpty!1375))

(get-info :version)

(assert (= (and mapNonEmpty!1375 ((_ is ValueCellFull!416) mapValue!1375)) b!28512))

(assert (= (and b!28505 ((_ is ValueCellFull!416) mapDefault!1375)) b!28506))

(assert (= start!3962 b!28505))

(declare-fun m!22677 () Bool)

(assert (=> b!28511 m!22677))

(assert (=> b!28511 m!22677))

(declare-fun m!22679 () Bool)

(assert (=> b!28511 m!22679))

(declare-fun m!22681 () Bool)

(assert (=> b!28511 m!22681))

(declare-fun m!22683 () Bool)

(assert (=> b!28511 m!22683))

(declare-fun m!22685 () Bool)

(assert (=> b!28507 m!22685))

(declare-fun m!22687 () Bool)

(assert (=> b!28502 m!22687))

(declare-fun m!22689 () Bool)

(assert (=> b!28502 m!22689))

(declare-fun m!22691 () Bool)

(assert (=> b!28504 m!22691))

(declare-fun m!22693 () Bool)

(assert (=> b!28503 m!22693))

(declare-fun m!22695 () Bool)

(assert (=> b!28508 m!22695))

(declare-fun m!22697 () Bool)

(assert (=> start!3962 m!22697))

(declare-fun m!22699 () Bool)

(assert (=> start!3962 m!22699))

(declare-fun m!22701 () Bool)

(assert (=> start!3962 m!22701))

(declare-fun m!22703 () Bool)

(assert (=> b!28510 m!22703))

(declare-fun m!22705 () Bool)

(assert (=> mapNonEmpty!1375 m!22705))

(check-sat (not b!28504) (not b!28511) (not b!28507) (not b!28510) (not mapNonEmpty!1375) b_and!1681 (not b_next!877) (not b!28502) (not start!3962) (not b!28503) tp_is_empty!1231 (not b!28508))
(check-sat b_and!1681 (not b_next!877))
