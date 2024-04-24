; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110964 () Bool)

(assert start!110964)

(declare-fun b_free!29575 () Bool)

(declare-fun b_next!29575 () Bool)

(assert (=> start!110964 (= b_free!29575 (not b_next!29575))))

(declare-fun tp!104047 () Bool)

(declare-fun b_and!47785 () Bool)

(assert (=> start!110964 (= tp!104047 b_and!47785)))

(declare-fun b!1311986 () Bool)

(declare-fun e!748519 () Bool)

(declare-fun tp_is_empty!35305 () Bool)

(assert (=> b!1311986 (= e!748519 tp_is_empty!35305)))

(declare-fun b!1311987 () Bool)

(declare-fun e!748520 () Bool)

(assert (=> b!1311987 (= e!748520 tp_is_empty!35305)))

(declare-fun b!1311988 () Bool)

(declare-fun e!748517 () Bool)

(assert (=> b!1311988 (= e!748517 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87659 0))(
  ( (array!87660 (arr!42305 (Array (_ BitVec 32) (_ BitVec 64))) (size!42856 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87659)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-datatypes ((V!52177 0))(
  ( (V!52178 (val!17727 Int)) )
))
(declare-fun minValue!1296 () V!52177)

(declare-datatypes ((ValueCell!16754 0))(
  ( (ValueCellFull!16754 (v!20349 V!52177)) (EmptyCell!16754) )
))
(declare-datatypes ((array!87661 0))(
  ( (array!87662 (arr!42306 (Array (_ BitVec 32) ValueCell!16754)) (size!42857 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87661)

(declare-fun zeroValue!1296 () V!52177)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585857 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22884 0))(
  ( (tuple2!22885 (_1!11453 (_ BitVec 64)) (_2!11453 V!52177)) )
))
(declare-datatypes ((List!30036 0))(
  ( (Nil!30033) (Cons!30032 (h!31250 tuple2!22884) (t!43634 List!30036)) )
))
(declare-datatypes ((ListLongMap!20549 0))(
  ( (ListLongMap!20550 (toList!10290 List!30036)) )
))
(declare-fun contains!8452 (ListLongMap!20549 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5294 (array!87659 array!87661 (_ BitVec 32) (_ BitVec 32) V!52177 V!52177 (_ BitVec 32) Int) ListLongMap!20549)

(assert (=> b!1311988 (= lt!585857 (contains!8452 (getCurrentListMap!5294 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!870663 () Bool)

(assert (=> start!110964 (=> (not res!870663) (not e!748517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110964 (= res!870663 (validMask!0 mask!2040))))

(assert (=> start!110964 e!748517))

(assert (=> start!110964 tp!104047))

(declare-fun array_inv!32239 (array!87659) Bool)

(assert (=> start!110964 (array_inv!32239 _keys!1628)))

(assert (=> start!110964 true))

(assert (=> start!110964 tp_is_empty!35305))

(declare-fun e!748516 () Bool)

(declare-fun array_inv!32240 (array!87661) Bool)

(assert (=> start!110964 (and (array_inv!32240 _values!1354) e!748516)))

(declare-fun mapIsEmpty!54586 () Bool)

(declare-fun mapRes!54586 () Bool)

(assert (=> mapIsEmpty!54586 mapRes!54586))

(declare-fun b!1311989 () Bool)

(declare-fun res!870665 () Bool)

(assert (=> b!1311989 (=> (not res!870665) (not e!748517))))

(assert (=> b!1311989 (= res!870665 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42856 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1311990 () Bool)

(declare-fun res!870664 () Bool)

(assert (=> b!1311990 (=> (not res!870664) (not e!748517))))

(assert (=> b!1311990 (= res!870664 (and (= (size!42857 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42856 _keys!1628) (size!42857 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1311991 () Bool)

(declare-fun res!870662 () Bool)

(assert (=> b!1311991 (=> (not res!870662) (not e!748517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87659 (_ BitVec 32)) Bool)

(assert (=> b!1311991 (= res!870662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311992 () Bool)

(declare-fun res!870661 () Bool)

(assert (=> b!1311992 (=> (not res!870661) (not e!748517))))

(declare-datatypes ((List!30037 0))(
  ( (Nil!30034) (Cons!30033 (h!31251 (_ BitVec 64)) (t!43635 List!30037)) )
))
(declare-fun arrayNoDuplicates!0 (array!87659 (_ BitVec 32) List!30037) Bool)

(assert (=> b!1311992 (= res!870661 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30034))))

(declare-fun b!1311993 () Bool)

(assert (=> b!1311993 (= e!748516 (and e!748520 mapRes!54586))))

(declare-fun condMapEmpty!54586 () Bool)

(declare-fun mapDefault!54586 () ValueCell!16754)

(assert (=> b!1311993 (= condMapEmpty!54586 (= (arr!42306 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16754)) mapDefault!54586)))))

(declare-fun mapNonEmpty!54586 () Bool)

(declare-fun tp!104046 () Bool)

(assert (=> mapNonEmpty!54586 (= mapRes!54586 (and tp!104046 e!748519))))

(declare-fun mapValue!54586 () ValueCell!16754)

(declare-fun mapKey!54586 () (_ BitVec 32))

(declare-fun mapRest!54586 () (Array (_ BitVec 32) ValueCell!16754))

(assert (=> mapNonEmpty!54586 (= (arr!42306 _values!1354) (store mapRest!54586 mapKey!54586 mapValue!54586))))

(assert (= (and start!110964 res!870663) b!1311990))

(assert (= (and b!1311990 res!870664) b!1311991))

(assert (= (and b!1311991 res!870662) b!1311992))

(assert (= (and b!1311992 res!870661) b!1311989))

(assert (= (and b!1311989 res!870665) b!1311988))

(assert (= (and b!1311993 condMapEmpty!54586) mapIsEmpty!54586))

(assert (= (and b!1311993 (not condMapEmpty!54586)) mapNonEmpty!54586))

(get-info :version)

(assert (= (and mapNonEmpty!54586 ((_ is ValueCellFull!16754) mapValue!54586)) b!1311986))

(assert (= (and b!1311993 ((_ is ValueCellFull!16754) mapDefault!54586)) b!1311987))

(assert (= start!110964 b!1311993))

(declare-fun m!1202003 () Bool)

(assert (=> b!1311991 m!1202003))

(declare-fun m!1202005 () Bool)

(assert (=> b!1311992 m!1202005))

(declare-fun m!1202007 () Bool)

(assert (=> start!110964 m!1202007))

(declare-fun m!1202009 () Bool)

(assert (=> start!110964 m!1202009))

(declare-fun m!1202011 () Bool)

(assert (=> start!110964 m!1202011))

(declare-fun m!1202013 () Bool)

(assert (=> mapNonEmpty!54586 m!1202013))

(declare-fun m!1202015 () Bool)

(assert (=> b!1311988 m!1202015))

(assert (=> b!1311988 m!1202015))

(declare-fun m!1202017 () Bool)

(assert (=> b!1311988 m!1202017))

(check-sat b_and!47785 (not b!1311988) tp_is_empty!35305 (not b!1311992) (not b!1311991) (not mapNonEmpty!54586) (not start!110964) (not b_next!29575))
(check-sat b_and!47785 (not b_next!29575))
