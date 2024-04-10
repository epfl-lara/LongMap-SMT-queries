; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83784 () Bool)

(assert start!83784)

(declare-fun b_free!19593 () Bool)

(declare-fun b_next!19593 () Bool)

(assert (=> start!83784 (= b_free!19593 (not b_next!19593))))

(declare-fun tp!68220 () Bool)

(declare-fun b_and!31275 () Bool)

(assert (=> start!83784 (= tp!68220 b_and!31275)))

(declare-fun mapIsEmpty!35909 () Bool)

(declare-fun mapRes!35909 () Bool)

(assert (=> mapIsEmpty!35909 mapRes!35909))

(declare-fun mapNonEmpty!35909 () Bool)

(declare-fun tp!68221 () Bool)

(declare-fun e!551627 () Bool)

(assert (=> mapNonEmpty!35909 (= mapRes!35909 (and tp!68221 e!551627))))

(declare-datatypes ((V!35099 0))(
  ( (V!35100 (val!11344 Int)) )
))
(declare-datatypes ((ValueCell!10812 0))(
  ( (ValueCellFull!10812 (v!13906 V!35099)) (EmptyCell!10812) )
))
(declare-datatypes ((array!61201 0))(
  ( (array!61202 (arr!29458 (Array (_ BitVec 32) ValueCell!10812)) (size!29937 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61201)

(declare-fun mapValue!35909 () ValueCell!10812)

(declare-fun mapKey!35909 () (_ BitVec 32))

(declare-fun mapRest!35909 () (Array (_ BitVec 32) ValueCell!10812))

(assert (=> mapNonEmpty!35909 (= (arr!29458 _values!1278) (store mapRest!35909 mapKey!35909 mapValue!35909))))

(declare-fun b!978461 () Bool)

(declare-fun e!551629 () Bool)

(declare-fun e!551631 () Bool)

(assert (=> b!978461 (= e!551629 (and e!551631 mapRes!35909))))

(declare-fun condMapEmpty!35909 () Bool)

(declare-fun mapDefault!35909 () ValueCell!10812)

(assert (=> b!978461 (= condMapEmpty!35909 (= (arr!29458 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10812)) mapDefault!35909)))))

(declare-fun b!978462 () Bool)

(declare-fun res!654807 () Bool)

(declare-fun e!551630 () Bool)

(assert (=> b!978462 (=> (not res!654807) (not e!551630))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978462 (= res!654807 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978463 () Bool)

(declare-fun res!654811 () Bool)

(assert (=> b!978463 (=> (not res!654811) (not e!551630))))

(declare-datatypes ((array!61203 0))(
  ( (array!61204 (arr!29459 (Array (_ BitVec 32) (_ BitVec 64))) (size!29938 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61203)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61203 (_ BitVec 32)) Bool)

(assert (=> b!978463 (= res!654811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978464 () Bool)

(assert (=> b!978464 (= e!551630 (not true))))

(declare-datatypes ((tuple2!14546 0))(
  ( (tuple2!14547 (_1!7284 (_ BitVec 64)) (_2!7284 V!35099)) )
))
(declare-datatypes ((List!20418 0))(
  ( (Nil!20415) (Cons!20414 (h!21576 tuple2!14546) (t!28967 List!20418)) )
))
(declare-datatypes ((ListLongMap!13243 0))(
  ( (ListLongMap!13244 (toList!6637 List!20418)) )
))
(declare-fun lt!433784 () ListLongMap!13243)

(declare-fun lt!433783 () tuple2!14546)

(declare-fun lt!433782 () tuple2!14546)

(declare-fun +!2942 (ListLongMap!13243 tuple2!14546) ListLongMap!13243)

(assert (=> b!978464 (= (+!2942 (+!2942 lt!433784 lt!433783) lt!433782) (+!2942 (+!2942 lt!433784 lt!433782) lt!433783))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!433780 () V!35099)

(assert (=> b!978464 (= lt!433782 (tuple2!14547 (select (arr!29459 _keys!1544) from!1932) lt!433780))))

(declare-fun minValue!1220 () V!35099)

(assert (=> b!978464 (= lt!433783 (tuple2!14547 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32523 0))(
  ( (Unit!32524) )
))
(declare-fun lt!433781 () Unit!32523)

(declare-fun addCommutativeForDiffKeys!570 (ListLongMap!13243 (_ BitVec 64) V!35099 (_ BitVec 64) V!35099) Unit!32523)

(assert (=> b!978464 (= lt!433781 (addCommutativeForDiffKeys!570 lt!433784 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29459 _keys!1544) from!1932) lt!433780))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15253 (ValueCell!10812 V!35099) V!35099)

(declare-fun dynLambda!1730 (Int (_ BitVec 64)) V!35099)

(assert (=> b!978464 (= lt!433780 (get!15253 (select (arr!29458 _values!1278) from!1932) (dynLambda!1730 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35099)

(declare-fun getCurrentListMapNoExtraKeys!3344 (array!61203 array!61201 (_ BitVec 32) (_ BitVec 32) V!35099 V!35099 (_ BitVec 32) Int) ListLongMap!13243)

(assert (=> b!978464 (= lt!433784 (+!2942 (getCurrentListMapNoExtraKeys!3344 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14547 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978466 () Bool)

(declare-fun tp_is_empty!22587 () Bool)

(assert (=> b!978466 (= e!551631 tp_is_empty!22587)))

(declare-fun b!978467 () Bool)

(declare-fun res!654806 () Bool)

(assert (=> b!978467 (=> (not res!654806) (not e!551630))))

(assert (=> b!978467 (= res!654806 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29938 _keys!1544))))))

(declare-fun b!978468 () Bool)

(declare-fun res!654810 () Bool)

(assert (=> b!978468 (=> (not res!654810) (not e!551630))))

(assert (=> b!978468 (= res!654810 (and (= (size!29937 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29938 _keys!1544) (size!29937 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978469 () Bool)

(assert (=> b!978469 (= e!551627 tp_is_empty!22587)))

(declare-fun b!978470 () Bool)

(declare-fun res!654812 () Bool)

(assert (=> b!978470 (=> (not res!654812) (not e!551630))))

(declare-datatypes ((List!20419 0))(
  ( (Nil!20416) (Cons!20415 (h!21577 (_ BitVec 64)) (t!28968 List!20419)) )
))
(declare-fun arrayNoDuplicates!0 (array!61203 (_ BitVec 32) List!20419) Bool)

(assert (=> b!978470 (= res!654812 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20416))))

(declare-fun b!978465 () Bool)

(declare-fun res!654809 () Bool)

(assert (=> b!978465 (=> (not res!654809) (not e!551630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978465 (= res!654809 (validKeyInArray!0 (select (arr!29459 _keys!1544) from!1932)))))

(declare-fun res!654808 () Bool)

(assert (=> start!83784 (=> (not res!654808) (not e!551630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83784 (= res!654808 (validMask!0 mask!1948))))

(assert (=> start!83784 e!551630))

(assert (=> start!83784 true))

(assert (=> start!83784 tp_is_empty!22587))

(declare-fun array_inv!22773 (array!61201) Bool)

(assert (=> start!83784 (and (array_inv!22773 _values!1278) e!551629)))

(assert (=> start!83784 tp!68220))

(declare-fun array_inv!22774 (array!61203) Bool)

(assert (=> start!83784 (array_inv!22774 _keys!1544)))

(assert (= (and start!83784 res!654808) b!978468))

(assert (= (and b!978468 res!654810) b!978463))

(assert (= (and b!978463 res!654811) b!978470))

(assert (= (and b!978470 res!654812) b!978467))

(assert (= (and b!978467 res!654806) b!978465))

(assert (= (and b!978465 res!654809) b!978462))

(assert (= (and b!978462 res!654807) b!978464))

(assert (= (and b!978461 condMapEmpty!35909) mapIsEmpty!35909))

(assert (= (and b!978461 (not condMapEmpty!35909)) mapNonEmpty!35909))

(get-info :version)

(assert (= (and mapNonEmpty!35909 ((_ is ValueCellFull!10812) mapValue!35909)) b!978469))

(assert (= (and b!978461 ((_ is ValueCellFull!10812) mapDefault!35909)) b!978466))

(assert (= start!83784 b!978461))

(declare-fun b_lambda!14637 () Bool)

(assert (=> (not b_lambda!14637) (not b!978464)))

(declare-fun t!28966 () Bool)

(declare-fun tb!6399 () Bool)

(assert (=> (and start!83784 (= defaultEntry!1281 defaultEntry!1281) t!28966) tb!6399))

(declare-fun result!12787 () Bool)

(assert (=> tb!6399 (= result!12787 tp_is_empty!22587)))

(assert (=> b!978464 t!28966))

(declare-fun b_and!31277 () Bool)

(assert (= b_and!31275 (and (=> t!28966 result!12787) b_and!31277)))

(declare-fun m!905611 () Bool)

(assert (=> b!978470 m!905611))

(declare-fun m!905613 () Bool)

(assert (=> b!978464 m!905613))

(declare-fun m!905615 () Bool)

(assert (=> b!978464 m!905615))

(declare-fun m!905617 () Bool)

(assert (=> b!978464 m!905617))

(declare-fun m!905619 () Bool)

(assert (=> b!978464 m!905619))

(declare-fun m!905621 () Bool)

(assert (=> b!978464 m!905621))

(declare-fun m!905623 () Bool)

(assert (=> b!978464 m!905623))

(assert (=> b!978464 m!905617))

(declare-fun m!905625 () Bool)

(assert (=> b!978464 m!905625))

(assert (=> b!978464 m!905613))

(declare-fun m!905627 () Bool)

(assert (=> b!978464 m!905627))

(declare-fun m!905629 () Bool)

(assert (=> b!978464 m!905629))

(assert (=> b!978464 m!905627))

(assert (=> b!978464 m!905621))

(declare-fun m!905631 () Bool)

(assert (=> b!978464 m!905631))

(assert (=> b!978464 m!905619))

(assert (=> b!978464 m!905631))

(declare-fun m!905633 () Bool)

(assert (=> b!978464 m!905633))

(declare-fun m!905635 () Bool)

(assert (=> mapNonEmpty!35909 m!905635))

(declare-fun m!905637 () Bool)

(assert (=> b!978463 m!905637))

(assert (=> b!978465 m!905617))

(assert (=> b!978465 m!905617))

(declare-fun m!905639 () Bool)

(assert (=> b!978465 m!905639))

(declare-fun m!905641 () Bool)

(assert (=> start!83784 m!905641))

(declare-fun m!905643 () Bool)

(assert (=> start!83784 m!905643))

(declare-fun m!905645 () Bool)

(assert (=> start!83784 m!905645))

(check-sat (not b!978463) b_and!31277 (not b!978470) (not start!83784) (not b!978465) tp_is_empty!22587 (not mapNonEmpty!35909) (not b_next!19593) (not b_lambda!14637) (not b!978464))
(check-sat b_and!31277 (not b_next!19593))
