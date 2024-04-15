; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20122 () Bool)

(assert start!20122)

(declare-fun b_free!4777 () Bool)

(declare-fun b_next!4777 () Bool)

(assert (=> start!20122 (= b_free!4777 (not b_next!4777))))

(declare-fun tp!17363 () Bool)

(declare-fun b_and!11497 () Bool)

(assert (=> start!20122 (= tp!17363 b_and!11497)))

(declare-fun b!197057 () Bool)

(declare-fun res!93131 () Bool)

(declare-fun e!129708 () Bool)

(assert (=> b!197057 (=> (not res!93131) (not e!129708))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8497 0))(
  ( (array!8498 (arr!3998 (Array (_ BitVec 32) (_ BitVec 64))) (size!4324 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8497)

(assert (=> b!197057 (= res!93131 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4324 _keys!825))))))

(declare-fun res!93129 () Bool)

(assert (=> start!20122 (=> (not res!93129) (not e!129708))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20122 (= res!93129 (validMask!0 mask!1149))))

(assert (=> start!20122 e!129708))

(declare-datatypes ((V!5825 0))(
  ( (V!5826 (val!2361 Int)) )
))
(declare-datatypes ((ValueCell!1973 0))(
  ( (ValueCellFull!1973 (v!4325 V!5825)) (EmptyCell!1973) )
))
(declare-datatypes ((array!8499 0))(
  ( (array!8500 (arr!3999 (Array (_ BitVec 32) ValueCell!1973)) (size!4325 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8499)

(declare-fun e!129707 () Bool)

(declare-fun array_inv!2597 (array!8499) Bool)

(assert (=> start!20122 (and (array_inv!2597 _values!649) e!129707)))

(assert (=> start!20122 true))

(declare-fun tp_is_empty!4633 () Bool)

(assert (=> start!20122 tp_is_empty!4633))

(declare-fun array_inv!2598 (array!8497) Bool)

(assert (=> start!20122 (array_inv!2598 _keys!825)))

(assert (=> start!20122 tp!17363))

(declare-fun b!197058 () Bool)

(declare-fun res!93132 () Bool)

(assert (=> b!197058 (=> (not res!93132) (not e!129708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8497 (_ BitVec 32)) Bool)

(assert (=> b!197058 (= res!93132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197059 () Bool)

(declare-fun e!129706 () Bool)

(assert (=> b!197059 (= e!129706 tp_is_empty!4633)))

(declare-fun b!197060 () Bool)

(declare-fun res!93133 () Bool)

(assert (=> b!197060 (=> (not res!93133) (not e!129708))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!197060 (= res!93133 (= (select (arr!3998 _keys!825) i!601) k0!843))))

(declare-fun b!197061 () Bool)

(declare-fun res!93128 () Bool)

(assert (=> b!197061 (=> (not res!93128) (not e!129708))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197061 (= res!93128 (and (= (size!4325 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4324 _keys!825) (size!4325 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197062 () Bool)

(assert (=> b!197062 (= e!129708 false)))

(declare-datatypes ((tuple2!3548 0))(
  ( (tuple2!3549 (_1!1785 (_ BitVec 64)) (_2!1785 V!5825)) )
))
(declare-datatypes ((List!2481 0))(
  ( (Nil!2478) (Cons!2477 (h!3119 tuple2!3548) (t!7403 List!2481)) )
))
(declare-datatypes ((ListLongMap!2451 0))(
  ( (ListLongMap!2452 (toList!1241 List!2481)) )
))
(declare-fun lt!97514 () ListLongMap!2451)

(declare-fun zeroValue!615 () V!5825)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5825)

(declare-fun getCurrentListMapNoExtraKeys!221 (array!8497 array!8499 (_ BitVec 32) (_ BitVec 32) V!5825 V!5825 (_ BitVec 32) Int) ListLongMap!2451)

(assert (=> b!197062 (= lt!97514 (getCurrentListMapNoExtraKeys!221 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8018 () Bool)

(declare-fun mapRes!8018 () Bool)

(assert (=> mapIsEmpty!8018 mapRes!8018))

(declare-fun b!197063 () Bool)

(declare-fun e!129704 () Bool)

(assert (=> b!197063 (= e!129704 tp_is_empty!4633)))

(declare-fun b!197064 () Bool)

(assert (=> b!197064 (= e!129707 (and e!129704 mapRes!8018))))

(declare-fun condMapEmpty!8018 () Bool)

(declare-fun mapDefault!8018 () ValueCell!1973)

(assert (=> b!197064 (= condMapEmpty!8018 (= (arr!3999 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1973)) mapDefault!8018)))))

(declare-fun b!197065 () Bool)

(declare-fun res!93134 () Bool)

(assert (=> b!197065 (=> (not res!93134) (not e!129708))))

(declare-datatypes ((List!2482 0))(
  ( (Nil!2479) (Cons!2478 (h!3120 (_ BitVec 64)) (t!7404 List!2482)) )
))
(declare-fun arrayNoDuplicates!0 (array!8497 (_ BitVec 32) List!2482) Bool)

(assert (=> b!197065 (= res!93134 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2479))))

(declare-fun b!197066 () Bool)

(declare-fun res!93130 () Bool)

(assert (=> b!197066 (=> (not res!93130) (not e!129708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197066 (= res!93130 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8018 () Bool)

(declare-fun tp!17362 () Bool)

(assert (=> mapNonEmpty!8018 (= mapRes!8018 (and tp!17362 e!129706))))

(declare-fun mapRest!8018 () (Array (_ BitVec 32) ValueCell!1973))

(declare-fun mapValue!8018 () ValueCell!1973)

(declare-fun mapKey!8018 () (_ BitVec 32))

(assert (=> mapNonEmpty!8018 (= (arr!3999 _values!649) (store mapRest!8018 mapKey!8018 mapValue!8018))))

(assert (= (and start!20122 res!93129) b!197061))

(assert (= (and b!197061 res!93128) b!197058))

(assert (= (and b!197058 res!93132) b!197065))

(assert (= (and b!197065 res!93134) b!197057))

(assert (= (and b!197057 res!93131) b!197066))

(assert (= (and b!197066 res!93130) b!197060))

(assert (= (and b!197060 res!93133) b!197062))

(assert (= (and b!197064 condMapEmpty!8018) mapIsEmpty!8018))

(assert (= (and b!197064 (not condMapEmpty!8018)) mapNonEmpty!8018))

(get-info :version)

(assert (= (and mapNonEmpty!8018 ((_ is ValueCellFull!1973) mapValue!8018)) b!197059))

(assert (= (and b!197064 ((_ is ValueCellFull!1973) mapDefault!8018)) b!197063))

(assert (= start!20122 b!197064))

(declare-fun m!223563 () Bool)

(assert (=> b!197058 m!223563))

(declare-fun m!223565 () Bool)

(assert (=> b!197062 m!223565))

(declare-fun m!223567 () Bool)

(assert (=> start!20122 m!223567))

(declare-fun m!223569 () Bool)

(assert (=> start!20122 m!223569))

(declare-fun m!223571 () Bool)

(assert (=> start!20122 m!223571))

(declare-fun m!223573 () Bool)

(assert (=> mapNonEmpty!8018 m!223573))

(declare-fun m!223575 () Bool)

(assert (=> b!197065 m!223575))

(declare-fun m!223577 () Bool)

(assert (=> b!197060 m!223577))

(declare-fun m!223579 () Bool)

(assert (=> b!197066 m!223579))

(check-sat (not b!197065) (not b_next!4777) (not mapNonEmpty!8018) (not start!20122) (not b!197058) b_and!11497 (not b!197062) (not b!197066) tp_is_empty!4633)
(check-sat b_and!11497 (not b_next!4777))
