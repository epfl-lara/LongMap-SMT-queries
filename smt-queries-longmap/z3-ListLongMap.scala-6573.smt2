; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83324 () Bool)

(assert start!83324)

(declare-fun b_free!19317 () Bool)

(declare-fun b_next!19317 () Bool)

(assert (=> start!83324 (= b_free!19317 (not b_next!19317))))

(declare-fun tp!67230 () Bool)

(declare-fun b_and!30855 () Bool)

(assert (=> start!83324 (= tp!67230 b_and!30855)))

(declare-fun b!972686 () Bool)

(declare-fun e!548255 () Bool)

(declare-fun tp_is_empty!22215 () Bool)

(assert (=> b!972686 (= e!548255 tp_is_empty!22215)))

(declare-fun b!972687 () Bool)

(declare-fun res!651082 () Bool)

(declare-fun e!548252 () Bool)

(assert (=> b!972687 (=> (not res!651082) (not e!548252))))

(declare-datatypes ((array!60477 0))(
  ( (array!60478 (arr!29102 (Array (_ BitVec 32) (_ BitVec 64))) (size!29581 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60477)

(declare-datatypes ((List!20179 0))(
  ( (Nil!20176) (Cons!20175 (h!21337 (_ BitVec 64)) (t!28594 List!20179)) )
))
(declare-fun arrayNoDuplicates!0 (array!60477 (_ BitVec 32) List!20179) Bool)

(assert (=> b!972687 (= res!651082 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20176))))

(declare-fun b!972688 () Bool)

(declare-fun e!548254 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972688 (= e!548254 (not (and (bvsge from!2118 #b00000000000000000000000000000000) (bvsle from!2118 (size!29581 _keys!1717)))))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34603 0))(
  ( (V!34604 (val!11158 Int)) )
))
(declare-datatypes ((ValueCell!10626 0))(
  ( (ValueCellFull!10626 (v!13717 V!34603)) (EmptyCell!10626) )
))
(declare-datatypes ((array!60479 0))(
  ( (array!60480 (arr!29103 (Array (_ BitVec 32) ValueCell!10626)) (size!29582 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60479)

(declare-datatypes ((tuple2!14316 0))(
  ( (tuple2!14317 (_1!7169 (_ BitVec 64)) (_2!7169 V!34603)) )
))
(declare-datatypes ((List!20180 0))(
  ( (Nil!20177) (Cons!20176 (h!21338 tuple2!14316) (t!28595 List!20180)) )
))
(declare-datatypes ((ListLongMap!13013 0))(
  ( (ListLongMap!13014 (toList!6522 List!20180)) )
))
(declare-fun lt!432101 () ListLongMap!13013)

(declare-fun zeroValue!1367 () V!34603)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34603)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun lt!432100 () (_ BitVec 64))

(declare-fun +!2894 (ListLongMap!13013 tuple2!14316) ListLongMap!13013)

(declare-fun getCurrentListMap!3755 (array!60477 array!60479 (_ BitVec 32) (_ BitVec 32) V!34603 V!34603 (_ BitVec 32) Int) ListLongMap!13013)

(declare-fun get!15079 (ValueCell!10626 V!34603) V!34603)

(declare-fun dynLambda!1683 (Int (_ BitVec 64)) V!34603)

(assert (=> b!972688 (= lt!432101 (+!2894 (getCurrentListMap!3755 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14317 lt!432100 (get!15079 (select (arr!29103 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1683 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32409 0))(
  ( (Unit!32410) )
))
(declare-fun lt!432099 () Unit!32409)

(declare-fun lemmaListMapRecursiveValidKeyArray!260 (array!60477 array!60479 (_ BitVec 32) (_ BitVec 32) V!34603 V!34603 (_ BitVec 32) Int) Unit!32409)

(assert (=> b!972688 (= lt!432099 (lemmaListMapRecursiveValidKeyArray!260 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972689 () Bool)

(declare-fun res!651084 () Bool)

(assert (=> b!972689 (=> (not res!651084) (not e!548252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60477 (_ BitVec 32)) Bool)

(assert (=> b!972689 (= res!651084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972690 () Bool)

(declare-fun res!651080 () Bool)

(assert (=> b!972690 (=> (not res!651080) (not e!548252))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5615 (ListLongMap!13013 (_ BitVec 64)) Bool)

(assert (=> b!972690 (= res!651080 (contains!5615 (getCurrentListMap!3755 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29102 _keys!1717) i!822)))))

(declare-fun b!972691 () Bool)

(declare-fun res!651077 () Bool)

(assert (=> b!972691 (=> (not res!651077) (not e!548252))))

(assert (=> b!972691 (= res!651077 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29581 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29581 _keys!1717))))))

(declare-fun b!972692 () Bool)

(declare-fun e!548257 () Bool)

(declare-fun e!548256 () Bool)

(declare-fun mapRes!35332 () Bool)

(assert (=> b!972692 (= e!548257 (and e!548256 mapRes!35332))))

(declare-fun condMapEmpty!35332 () Bool)

(declare-fun mapDefault!35332 () ValueCell!10626)

(assert (=> b!972692 (= condMapEmpty!35332 (= (arr!29103 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10626)) mapDefault!35332)))))

(declare-fun b!972693 () Bool)

(declare-fun res!651078 () Bool)

(assert (=> b!972693 (=> (not res!651078) (not e!548252))))

(assert (=> b!972693 (= res!651078 (and (= (size!29582 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29581 _keys!1717) (size!29582 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972694 () Bool)

(assert (=> b!972694 (= e!548252 e!548254)))

(declare-fun res!651083 () Bool)

(assert (=> b!972694 (=> (not res!651083) (not e!548254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972694 (= res!651083 (validKeyInArray!0 lt!432100))))

(assert (=> b!972694 (= lt!432100 (select (arr!29102 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972694 (= lt!432101 (getCurrentListMap!3755 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35332 () Bool)

(declare-fun tp!67229 () Bool)

(assert (=> mapNonEmpty!35332 (= mapRes!35332 (and tp!67229 e!548255))))

(declare-fun mapValue!35332 () ValueCell!10626)

(declare-fun mapKey!35332 () (_ BitVec 32))

(declare-fun mapRest!35332 () (Array (_ BitVec 32) ValueCell!10626))

(assert (=> mapNonEmpty!35332 (= (arr!29103 _values!1425) (store mapRest!35332 mapKey!35332 mapValue!35332))))

(declare-fun mapIsEmpty!35332 () Bool)

(assert (=> mapIsEmpty!35332 mapRes!35332))

(declare-fun res!651081 () Bool)

(assert (=> start!83324 (=> (not res!651081) (not e!548252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83324 (= res!651081 (validMask!0 mask!2147))))

(assert (=> start!83324 e!548252))

(assert (=> start!83324 true))

(declare-fun array_inv!22513 (array!60479) Bool)

(assert (=> start!83324 (and (array_inv!22513 _values!1425) e!548257)))

(assert (=> start!83324 tp_is_empty!22215))

(assert (=> start!83324 tp!67230))

(declare-fun array_inv!22514 (array!60477) Bool)

(assert (=> start!83324 (array_inv!22514 _keys!1717)))

(declare-fun b!972695 () Bool)

(declare-fun res!651079 () Bool)

(assert (=> b!972695 (=> (not res!651079) (not e!548252))))

(assert (=> b!972695 (= res!651079 (validKeyInArray!0 (select (arr!29102 _keys!1717) i!822)))))

(declare-fun b!972696 () Bool)

(assert (=> b!972696 (= e!548256 tp_is_empty!22215)))

(assert (= (and start!83324 res!651081) b!972693))

(assert (= (and b!972693 res!651078) b!972689))

(assert (= (and b!972689 res!651084) b!972687))

(assert (= (and b!972687 res!651082) b!972691))

(assert (= (and b!972691 res!651077) b!972695))

(assert (= (and b!972695 res!651079) b!972690))

(assert (= (and b!972690 res!651080) b!972694))

(assert (= (and b!972694 res!651083) b!972688))

(assert (= (and b!972692 condMapEmpty!35332) mapIsEmpty!35332))

(assert (= (and b!972692 (not condMapEmpty!35332)) mapNonEmpty!35332))

(get-info :version)

(assert (= (and mapNonEmpty!35332 ((_ is ValueCellFull!10626) mapValue!35332)) b!972686))

(assert (= (and b!972692 ((_ is ValueCellFull!10626) mapDefault!35332)) b!972696))

(assert (= start!83324 b!972692))

(declare-fun b_lambda!14481 () Bool)

(assert (=> (not b_lambda!14481) (not b!972688)))

(declare-fun t!28593 () Bool)

(declare-fun tb!6265 () Bool)

(assert (=> (and start!83324 (= defaultEntry!1428 defaultEntry!1428) t!28593) tb!6265))

(declare-fun result!12507 () Bool)

(assert (=> tb!6265 (= result!12507 tp_is_empty!22215)))

(assert (=> b!972688 t!28593))

(declare-fun b_and!30857 () Bool)

(assert (= b_and!30855 (and (=> t!28593 result!12507) b_and!30857)))

(declare-fun m!900117 () Bool)

(assert (=> mapNonEmpty!35332 m!900117))

(declare-fun m!900119 () Bool)

(assert (=> b!972688 m!900119))

(declare-fun m!900121 () Bool)

(assert (=> b!972688 m!900121))

(declare-fun m!900123 () Bool)

(assert (=> b!972688 m!900123))

(assert (=> b!972688 m!900119))

(assert (=> b!972688 m!900123))

(declare-fun m!900125 () Bool)

(assert (=> b!972688 m!900125))

(assert (=> b!972688 m!900121))

(declare-fun m!900127 () Bool)

(assert (=> b!972688 m!900127))

(declare-fun m!900129 () Bool)

(assert (=> b!972688 m!900129))

(declare-fun m!900131 () Bool)

(assert (=> b!972687 m!900131))

(declare-fun m!900133 () Bool)

(assert (=> b!972694 m!900133))

(declare-fun m!900135 () Bool)

(assert (=> b!972694 m!900135))

(declare-fun m!900137 () Bool)

(assert (=> b!972694 m!900137))

(declare-fun m!900139 () Bool)

(assert (=> start!83324 m!900139))

(declare-fun m!900141 () Bool)

(assert (=> start!83324 m!900141))

(declare-fun m!900143 () Bool)

(assert (=> start!83324 m!900143))

(declare-fun m!900145 () Bool)

(assert (=> b!972690 m!900145))

(declare-fun m!900147 () Bool)

(assert (=> b!972690 m!900147))

(assert (=> b!972690 m!900145))

(assert (=> b!972690 m!900147))

(declare-fun m!900149 () Bool)

(assert (=> b!972690 m!900149))

(assert (=> b!972695 m!900147))

(assert (=> b!972695 m!900147))

(declare-fun m!900151 () Bool)

(assert (=> b!972695 m!900151))

(declare-fun m!900153 () Bool)

(assert (=> b!972689 m!900153))

(check-sat (not b_next!19317) (not start!83324) tp_is_empty!22215 (not b!972690) (not b_lambda!14481) (not mapNonEmpty!35332) (not b!972688) (not b!972695) (not b!972687) b_and!30857 (not b!972689) (not b!972694))
(check-sat b_and!30857 (not b_next!19317))
