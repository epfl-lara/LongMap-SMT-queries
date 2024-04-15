; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83794 () Bool)

(assert start!83794)

(declare-fun b_free!19621 () Bool)

(declare-fun b_next!19621 () Bool)

(assert (=> start!83794 (= b_free!19621 (not b_next!19621))))

(declare-fun tp!68306 () Bool)

(declare-fun b_and!31305 () Bool)

(assert (=> start!83794 (= tp!68306 b_and!31305)))

(declare-fun b!978672 () Bool)

(declare-fun res!654999 () Bool)

(declare-fun e!551693 () Bool)

(assert (=> b!978672 (=> (not res!654999) (not e!551693))))

(declare-datatypes ((array!61176 0))(
  ( (array!61177 (arr!29446 (Array (_ BitVec 32) (_ BitVec 64))) (size!29927 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61176)

(declare-datatypes ((List!20454 0))(
  ( (Nil!20451) (Cons!20450 (h!21612 (_ BitVec 64)) (t!29022 List!20454)) )
))
(declare-fun arrayNoDuplicates!0 (array!61176 (_ BitVec 32) List!20454) Bool)

(assert (=> b!978672 (= res!654999 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20451))))

(declare-fun mapNonEmpty!35951 () Bool)

(declare-fun mapRes!35951 () Bool)

(declare-fun tp!68305 () Bool)

(declare-fun e!551694 () Bool)

(assert (=> mapNonEmpty!35951 (= mapRes!35951 (and tp!68305 e!551694))))

(declare-datatypes ((V!35137 0))(
  ( (V!35138 (val!11358 Int)) )
))
(declare-datatypes ((ValueCell!10826 0))(
  ( (ValueCellFull!10826 (v!13919 V!35137)) (EmptyCell!10826) )
))
(declare-datatypes ((array!61178 0))(
  ( (array!61179 (arr!29447 (Array (_ BitVec 32) ValueCell!10826)) (size!29928 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61178)

(declare-fun mapValue!35951 () ValueCell!10826)

(declare-fun mapRest!35951 () (Array (_ BitVec 32) ValueCell!10826))

(declare-fun mapKey!35951 () (_ BitVec 32))

(assert (=> mapNonEmpty!35951 (= (arr!29447 _values!1278) (store mapRest!35951 mapKey!35951 mapValue!35951))))

(declare-fun mapIsEmpty!35951 () Bool)

(assert (=> mapIsEmpty!35951 mapRes!35951))

(declare-fun b!978674 () Bool)

(declare-fun res!654997 () Bool)

(assert (=> b!978674 (=> (not res!654997) (not e!551693))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61176 (_ BitVec 32)) Bool)

(assert (=> b!978674 (= res!654997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978675 () Bool)

(declare-fun tp_is_empty!22615 () Bool)

(assert (=> b!978675 (= e!551694 tp_is_empty!22615)))

(declare-fun b!978676 () Bool)

(declare-fun res!654994 () Bool)

(assert (=> b!978676 (=> (not res!654994) (not e!551693))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978676 (= res!654994 (and (= (size!29928 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29927 _keys!1544) (size!29928 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978677 () Bool)

(declare-fun e!551695 () Bool)

(assert (=> b!978677 (= e!551695 tp_is_empty!22615)))

(declare-fun b!978678 () Bool)

(declare-fun e!551696 () Bool)

(assert (=> b!978678 (= e!551696 true)))

(declare-datatypes ((tuple2!14628 0))(
  ( (tuple2!14629 (_1!7325 (_ BitVec 64)) (_2!7325 V!35137)) )
))
(declare-fun lt!433769 () tuple2!14628)

(declare-datatypes ((List!20455 0))(
  ( (Nil!20452) (Cons!20451 (h!21613 tuple2!14628) (t!29023 List!20455)) )
))
(declare-datatypes ((ListLongMap!13315 0))(
  ( (ListLongMap!13316 (toList!6673 List!20455)) )
))
(declare-fun lt!433766 () ListLongMap!13315)

(declare-fun lt!433765 () tuple2!14628)

(declare-fun lt!433764 () ListLongMap!13315)

(declare-fun +!2973 (ListLongMap!13315 tuple2!14628) ListLongMap!13315)

(assert (=> b!978678 (= lt!433764 (+!2973 (+!2973 lt!433766 lt!433765) lt!433769))))

(declare-fun zeroValue!1220 () V!35137)

(declare-datatypes ((Unit!32412 0))(
  ( (Unit!32413) )
))
(declare-fun lt!433773 () Unit!32412)

(declare-fun lt!433770 () V!35137)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!577 (ListLongMap!13315 (_ BitVec 64) V!35137 (_ BitVec 64) V!35137) Unit!32412)

(assert (=> b!978678 (= lt!433773 (addCommutativeForDiffKeys!577 lt!433766 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29446 _keys!1544) from!1932) lt!433770))))

(declare-fun b!978679 () Bool)

(declare-fun res!654996 () Bool)

(assert (=> b!978679 (=> (not res!654996) (not e!551693))))

(assert (=> b!978679 (= res!654996 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978680 () Bool)

(declare-fun res!654998 () Bool)

(assert (=> b!978680 (=> (not res!654998) (not e!551693))))

(assert (=> b!978680 (= res!654998 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29927 _keys!1544))))))

(declare-fun res!654992 () Bool)

(assert (=> start!83794 (=> (not res!654992) (not e!551693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83794 (= res!654992 (validMask!0 mask!1948))))

(assert (=> start!83794 e!551693))

(assert (=> start!83794 true))

(assert (=> start!83794 tp_is_empty!22615))

(declare-fun e!551691 () Bool)

(declare-fun array_inv!22805 (array!61178) Bool)

(assert (=> start!83794 (and (array_inv!22805 _values!1278) e!551691)))

(assert (=> start!83794 tp!68306))

(declare-fun array_inv!22806 (array!61176) Bool)

(assert (=> start!83794 (array_inv!22806 _keys!1544)))

(declare-fun b!978673 () Bool)

(assert (=> b!978673 (= e!551691 (and e!551695 mapRes!35951))))

(declare-fun condMapEmpty!35951 () Bool)

(declare-fun mapDefault!35951 () ValueCell!10826)

(assert (=> b!978673 (= condMapEmpty!35951 (= (arr!29447 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10826)) mapDefault!35951)))))

(declare-fun b!978681 () Bool)

(assert (=> b!978681 (= e!551693 (not e!551696))))

(declare-fun res!654993 () Bool)

(assert (=> b!978681 (=> res!654993 e!551696)))

(assert (=> b!978681 (= res!654993 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29446 _keys!1544) from!1932)))))

(declare-fun lt!433772 () ListLongMap!13315)

(declare-fun lt!433767 () tuple2!14628)

(assert (=> b!978681 (= (+!2973 lt!433772 lt!433765) (+!2973 lt!433764 lt!433767))))

(declare-fun lt!433771 () ListLongMap!13315)

(assert (=> b!978681 (= lt!433764 (+!2973 lt!433771 lt!433765))))

(assert (=> b!978681 (= lt!433765 (tuple2!14629 (select (arr!29446 _keys!1544) from!1932) lt!433770))))

(assert (=> b!978681 (= lt!433772 (+!2973 lt!433771 lt!433767))))

(declare-fun minValue!1220 () V!35137)

(assert (=> b!978681 (= lt!433767 (tuple2!14629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!433768 () Unit!32412)

(assert (=> b!978681 (= lt!433768 (addCommutativeForDiffKeys!577 lt!433771 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29446 _keys!1544) from!1932) lt!433770))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15264 (ValueCell!10826 V!35137) V!35137)

(declare-fun dynLambda!1726 (Int (_ BitVec 64)) V!35137)

(assert (=> b!978681 (= lt!433770 (get!15264 (select (arr!29447 _values!1278) from!1932) (dynLambda!1726 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!978681 (= lt!433771 (+!2973 lt!433766 lt!433769))))

(assert (=> b!978681 (= lt!433769 (tuple2!14629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3393 (array!61176 array!61178 (_ BitVec 32) (_ BitVec 32) V!35137 V!35137 (_ BitVec 32) Int) ListLongMap!13315)

(assert (=> b!978681 (= lt!433766 (getCurrentListMapNoExtraKeys!3393 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!978682 () Bool)

(declare-fun res!654995 () Bool)

(assert (=> b!978682 (=> (not res!654995) (not e!551693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978682 (= res!654995 (validKeyInArray!0 (select (arr!29446 _keys!1544) from!1932)))))

(assert (= (and start!83794 res!654992) b!978676))

(assert (= (and b!978676 res!654994) b!978674))

(assert (= (and b!978674 res!654997) b!978672))

(assert (= (and b!978672 res!654999) b!978680))

(assert (= (and b!978680 res!654998) b!978682))

(assert (= (and b!978682 res!654995) b!978679))

(assert (= (and b!978679 res!654996) b!978681))

(assert (= (and b!978681 (not res!654993)) b!978678))

(assert (= (and b!978673 condMapEmpty!35951) mapIsEmpty!35951))

(assert (= (and b!978673 (not condMapEmpty!35951)) mapNonEmpty!35951))

(get-info :version)

(assert (= (and mapNonEmpty!35951 ((_ is ValueCellFull!10826) mapValue!35951)) b!978675))

(assert (= (and b!978673 ((_ is ValueCellFull!10826) mapDefault!35951)) b!978677))

(assert (= start!83794 b!978673))

(declare-fun b_lambda!14647 () Bool)

(assert (=> (not b_lambda!14647) (not b!978681)))

(declare-fun t!29021 () Bool)

(declare-fun tb!6419 () Bool)

(assert (=> (and start!83794 (= defaultEntry!1281 defaultEntry!1281) t!29021) tb!6419))

(declare-fun result!12835 () Bool)

(assert (=> tb!6419 (= result!12835 tp_is_empty!22615)))

(assert (=> b!978681 t!29021))

(declare-fun b_and!31307 () Bool)

(assert (= b_and!31305 (and (=> t!29021 result!12835) b_and!31307)))

(declare-fun m!905357 () Bool)

(assert (=> b!978674 m!905357))

(declare-fun m!905359 () Bool)

(assert (=> b!978682 m!905359))

(assert (=> b!978682 m!905359))

(declare-fun m!905361 () Bool)

(assert (=> b!978682 m!905361))

(declare-fun m!905363 () Bool)

(assert (=> b!978678 m!905363))

(assert (=> b!978678 m!905363))

(declare-fun m!905365 () Bool)

(assert (=> b!978678 m!905365))

(assert (=> b!978678 m!905359))

(assert (=> b!978678 m!905359))

(declare-fun m!905367 () Bool)

(assert (=> b!978678 m!905367))

(declare-fun m!905369 () Bool)

(assert (=> start!83794 m!905369))

(declare-fun m!905371 () Bool)

(assert (=> start!83794 m!905371))

(declare-fun m!905373 () Bool)

(assert (=> start!83794 m!905373))

(declare-fun m!905375 () Bool)

(assert (=> mapNonEmpty!35951 m!905375))

(declare-fun m!905377 () Bool)

(assert (=> b!978672 m!905377))

(assert (=> b!978681 m!905359))

(declare-fun m!905379 () Bool)

(assert (=> b!978681 m!905379))

(assert (=> b!978681 m!905359))

(declare-fun m!905381 () Bool)

(assert (=> b!978681 m!905381))

(declare-fun m!905383 () Bool)

(assert (=> b!978681 m!905383))

(declare-fun m!905385 () Bool)

(assert (=> b!978681 m!905385))

(declare-fun m!905387 () Bool)

(assert (=> b!978681 m!905387))

(declare-fun m!905389 () Bool)

(assert (=> b!978681 m!905389))

(declare-fun m!905391 () Bool)

(assert (=> b!978681 m!905391))

(declare-fun m!905393 () Bool)

(assert (=> b!978681 m!905393))

(declare-fun m!905395 () Bool)

(assert (=> b!978681 m!905395))

(assert (=> b!978681 m!905379))

(assert (=> b!978681 m!905395))

(declare-fun m!905397 () Bool)

(assert (=> b!978681 m!905397))

(check-sat (not b!978682) (not b!978678) b_and!31307 (not start!83794) (not mapNonEmpty!35951) (not b!978674) (not b!978672) (not b!978681) tp_is_empty!22615 (not b_next!19621) (not b_lambda!14647))
(check-sat b_and!31307 (not b_next!19621))
