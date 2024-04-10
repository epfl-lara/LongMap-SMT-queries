; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20096 () Bool)

(assert start!20096)

(declare-fun b_free!4755 () Bool)

(declare-fun b_next!4755 () Bool)

(assert (=> start!20096 (= b_free!4755 (not b_next!4755))))

(declare-fun tp!17296 () Bool)

(declare-fun b_and!11501 () Bool)

(assert (=> start!20096 (= tp!17296 b_and!11501)))

(declare-fun res!92997 () Bool)

(declare-fun e!129644 () Bool)

(assert (=> start!20096 (=> (not res!92997) (not e!129644))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20096 (= res!92997 (validMask!0 mask!1149))))

(assert (=> start!20096 e!129644))

(declare-datatypes ((V!5795 0))(
  ( (V!5796 (val!2350 Int)) )
))
(declare-datatypes ((ValueCell!1962 0))(
  ( (ValueCellFull!1962 (v!4320 V!5795)) (EmptyCell!1962) )
))
(declare-datatypes ((array!8477 0))(
  ( (array!8478 (arr!3989 (Array (_ BitVec 32) ValueCell!1962)) (size!4314 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8477)

(declare-fun e!129641 () Bool)

(declare-fun array_inv!2603 (array!8477) Bool)

(assert (=> start!20096 (and (array_inv!2603 _values!649) e!129641)))

(assert (=> start!20096 true))

(declare-fun tp_is_empty!4611 () Bool)

(assert (=> start!20096 tp_is_empty!4611))

(declare-datatypes ((array!8479 0))(
  ( (array!8480 (arr!3990 (Array (_ BitVec 32) (_ BitVec 64))) (size!4315 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8479)

(declare-fun array_inv!2604 (array!8479) Bool)

(assert (=> start!20096 (array_inv!2604 _keys!825)))

(assert (=> start!20096 tp!17296))

(declare-fun b!196874 () Bool)

(assert (=> b!196874 (= e!129644 false)))

(declare-datatypes ((tuple2!3580 0))(
  ( (tuple2!3581 (_1!1801 (_ BitVec 64)) (_2!1801 V!5795)) )
))
(declare-datatypes ((List!2492 0))(
  ( (Nil!2489) (Cons!2488 (h!3130 tuple2!3580) (t!7423 List!2492)) )
))
(declare-datatypes ((ListLongMap!2493 0))(
  ( (ListLongMap!2494 (toList!1262 List!2492)) )
))
(declare-fun lt!97662 () ListLongMap!2493)

(declare-fun zeroValue!615 () V!5795)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5795)

(declare-fun getCurrentListMapNoExtraKeys!227 (array!8479 array!8477 (_ BitVec 32) (_ BitVec 32) V!5795 V!5795 (_ BitVec 32) Int) ListLongMap!2493)

(assert (=> b!196874 (= lt!97662 (getCurrentListMapNoExtraKeys!227 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196875 () Bool)

(declare-fun e!129640 () Bool)

(assert (=> b!196875 (= e!129640 tp_is_empty!4611)))

(declare-fun b!196876 () Bool)

(declare-fun res!92998 () Bool)

(assert (=> b!196876 (=> (not res!92998) (not e!129644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8479 (_ BitVec 32)) Bool)

(assert (=> b!196876 (= res!92998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196877 () Bool)

(declare-fun res!92992 () Bool)

(assert (=> b!196877 (=> (not res!92992) (not e!129644))))

(declare-datatypes ((List!2493 0))(
  ( (Nil!2490) (Cons!2489 (h!3131 (_ BitVec 64)) (t!7424 List!2493)) )
))
(declare-fun arrayNoDuplicates!0 (array!8479 (_ BitVec 32) List!2493) Bool)

(assert (=> b!196877 (= res!92992 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2490))))

(declare-fun b!196878 () Bool)

(declare-fun res!92996 () Bool)

(assert (=> b!196878 (=> (not res!92996) (not e!129644))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196878 (= res!92996 (= (select (arr!3990 _keys!825) i!601) k0!843))))

(declare-fun b!196879 () Bool)

(declare-fun e!129643 () Bool)

(assert (=> b!196879 (= e!129643 tp_is_empty!4611)))

(declare-fun mapIsEmpty!7985 () Bool)

(declare-fun mapRes!7985 () Bool)

(assert (=> mapIsEmpty!7985 mapRes!7985))

(declare-fun b!196880 () Bool)

(assert (=> b!196880 (= e!129641 (and e!129643 mapRes!7985))))

(declare-fun condMapEmpty!7985 () Bool)

(declare-fun mapDefault!7985 () ValueCell!1962)

(assert (=> b!196880 (= condMapEmpty!7985 (= (arr!3989 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1962)) mapDefault!7985)))))

(declare-fun mapNonEmpty!7985 () Bool)

(declare-fun tp!17297 () Bool)

(assert (=> mapNonEmpty!7985 (= mapRes!7985 (and tp!17297 e!129640))))

(declare-fun mapValue!7985 () ValueCell!1962)

(declare-fun mapKey!7985 () (_ BitVec 32))

(declare-fun mapRest!7985 () (Array (_ BitVec 32) ValueCell!1962))

(assert (=> mapNonEmpty!7985 (= (arr!3989 _values!649) (store mapRest!7985 mapKey!7985 mapValue!7985))))

(declare-fun b!196881 () Bool)

(declare-fun res!92993 () Bool)

(assert (=> b!196881 (=> (not res!92993) (not e!129644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196881 (= res!92993 (validKeyInArray!0 k0!843))))

(declare-fun b!196882 () Bool)

(declare-fun res!92994 () Bool)

(assert (=> b!196882 (=> (not res!92994) (not e!129644))))

(assert (=> b!196882 (= res!92994 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4315 _keys!825))))))

(declare-fun b!196883 () Bool)

(declare-fun res!92995 () Bool)

(assert (=> b!196883 (=> (not res!92995) (not e!129644))))

(assert (=> b!196883 (= res!92995 (and (= (size!4314 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4315 _keys!825) (size!4314 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20096 res!92997) b!196883))

(assert (= (and b!196883 res!92995) b!196876))

(assert (= (and b!196876 res!92998) b!196877))

(assert (= (and b!196877 res!92992) b!196882))

(assert (= (and b!196882 res!92994) b!196881))

(assert (= (and b!196881 res!92993) b!196878))

(assert (= (and b!196878 res!92996) b!196874))

(assert (= (and b!196880 condMapEmpty!7985) mapIsEmpty!7985))

(assert (= (and b!196880 (not condMapEmpty!7985)) mapNonEmpty!7985))

(get-info :version)

(assert (= (and mapNonEmpty!7985 ((_ is ValueCellFull!1962) mapValue!7985)) b!196875))

(assert (= (and b!196880 ((_ is ValueCellFull!1962) mapDefault!7985)) b!196879))

(assert (= start!20096 b!196880))

(declare-fun m!223981 () Bool)

(assert (=> b!196881 m!223981))

(declare-fun m!223983 () Bool)

(assert (=> start!20096 m!223983))

(declare-fun m!223985 () Bool)

(assert (=> start!20096 m!223985))

(declare-fun m!223987 () Bool)

(assert (=> start!20096 m!223987))

(declare-fun m!223989 () Bool)

(assert (=> b!196878 m!223989))

(declare-fun m!223991 () Bool)

(assert (=> b!196876 m!223991))

(declare-fun m!223993 () Bool)

(assert (=> b!196874 m!223993))

(declare-fun m!223995 () Bool)

(assert (=> b!196877 m!223995))

(declare-fun m!223997 () Bool)

(assert (=> mapNonEmpty!7985 m!223997))

(check-sat (not b_next!4755) b_and!11501 (not b!196874) (not b!196877) (not mapNonEmpty!7985) (not start!20096) (not b!196876) (not b!196881) tp_is_empty!4611)
(check-sat b_and!11501 (not b_next!4755))
