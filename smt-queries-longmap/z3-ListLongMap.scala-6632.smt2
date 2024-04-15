; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83746 () Bool)

(assert start!83746)

(declare-fun b_free!19573 () Bool)

(declare-fun b_next!19573 () Bool)

(assert (=> start!83746 (= b_free!19573 (not b_next!19573))))

(declare-fun tp!68162 () Bool)

(declare-fun b_and!31209 () Bool)

(assert (=> start!83746 (= tp!68162 b_and!31209)))

(declare-fun b!977902 () Bool)

(declare-fun res!654491 () Bool)

(declare-fun e!551330 () Bool)

(assert (=> b!977902 (=> (not res!654491) (not e!551330))))

(declare-datatypes ((array!61090 0))(
  ( (array!61091 (arr!29403 (Array (_ BitVec 32) (_ BitVec 64))) (size!29884 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61090)

(declare-datatypes ((List!20419 0))(
  ( (Nil!20416) (Cons!20415 (h!21577 (_ BitVec 64)) (t!28939 List!20419)) )
))
(declare-fun arrayNoDuplicates!0 (array!61090 (_ BitVec 32) List!20419) Bool)

(assert (=> b!977902 (= res!654491 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20416))))

(declare-fun b!977903 () Bool)

(assert (=> b!977903 (= e!551330 (not true))))

(declare-datatypes ((V!35073 0))(
  ( (V!35074 (val!11334 Int)) )
))
(declare-datatypes ((tuple2!14592 0))(
  ( (tuple2!14593 (_1!7307 (_ BitVec 64)) (_2!7307 V!35073)) )
))
(declare-datatypes ((List!20420 0))(
  ( (Nil!20417) (Cons!20416 (h!21578 tuple2!14592) (t!28940 List!20420)) )
))
(declare-datatypes ((ListLongMap!13279 0))(
  ( (ListLongMap!13280 (toList!6655 List!20420)) )
))
(declare-fun lt!433398 () ListLongMap!13279)

(declare-fun lt!433397 () tuple2!14592)

(declare-fun lt!433394 () tuple2!14592)

(declare-fun +!2955 (ListLongMap!13279 tuple2!14592) ListLongMap!13279)

(assert (=> b!977903 (= (+!2955 (+!2955 lt!433398 lt!433397) lt!433394) (+!2955 (+!2955 lt!433398 lt!433394) lt!433397))))

(declare-fun lt!433396 () V!35073)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!977903 (= lt!433394 (tuple2!14593 (select (arr!29403 _keys!1544) from!1932) lt!433396))))

(declare-fun minValue!1220 () V!35073)

(assert (=> b!977903 (= lt!433397 (tuple2!14593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32376 0))(
  ( (Unit!32377) )
))
(declare-fun lt!433395 () Unit!32376)

(declare-fun addCommutativeForDiffKeys!559 (ListLongMap!13279 (_ BitVec 64) V!35073 (_ BitVec 64) V!35073) Unit!32376)

(assert (=> b!977903 (= lt!433395 (addCommutativeForDiffKeys!559 lt!433398 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29403 _keys!1544) from!1932) lt!433396))))

(declare-datatypes ((ValueCell!10802 0))(
  ( (ValueCellFull!10802 (v!13895 V!35073)) (EmptyCell!10802) )
))
(declare-datatypes ((array!61092 0))(
  ( (array!61093 (arr!29404 (Array (_ BitVec 32) ValueCell!10802)) (size!29885 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61092)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15230 (ValueCell!10802 V!35073) V!35073)

(declare-fun dynLambda!1708 (Int (_ BitVec 64)) V!35073)

(assert (=> b!977903 (= lt!433396 (get!15230 (select (arr!29404 _values!1278) from!1932) (dynLambda!1708 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35073)

(declare-fun getCurrentListMapNoExtraKeys!3375 (array!61090 array!61092 (_ BitVec 32) (_ BitVec 32) V!35073 V!35073 (_ BitVec 32) Int) ListLongMap!13279)

(assert (=> b!977903 (= lt!433398 (+!2955 (getCurrentListMapNoExtraKeys!3375 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14593 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun res!654492 () Bool)

(assert (=> start!83746 (=> (not res!654492) (not e!551330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83746 (= res!654492 (validMask!0 mask!1948))))

(assert (=> start!83746 e!551330))

(assert (=> start!83746 true))

(declare-fun tp_is_empty!22567 () Bool)

(assert (=> start!83746 tp_is_empty!22567))

(declare-fun e!551329 () Bool)

(declare-fun array_inv!22771 (array!61092) Bool)

(assert (=> start!83746 (and (array_inv!22771 _values!1278) e!551329)))

(assert (=> start!83746 tp!68162))

(declare-fun array_inv!22772 (array!61090) Bool)

(assert (=> start!83746 (array_inv!22772 _keys!1544)))

(declare-fun b!977904 () Bool)

(declare-fun e!551332 () Bool)

(assert (=> b!977904 (= e!551332 tp_is_empty!22567)))

(declare-fun b!977905 () Bool)

(declare-fun res!654489 () Bool)

(assert (=> b!977905 (=> (not res!654489) (not e!551330))))

(assert (=> b!977905 (= res!654489 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29884 _keys!1544))))))

(declare-fun b!977906 () Bool)

(declare-fun e!551333 () Bool)

(assert (=> b!977906 (= e!551333 tp_is_empty!22567)))

(declare-fun b!977907 () Bool)

(declare-fun res!654487 () Bool)

(assert (=> b!977907 (=> (not res!654487) (not e!551330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61090 (_ BitVec 32)) Bool)

(assert (=> b!977907 (= res!654487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977908 () Bool)

(declare-fun res!654486 () Bool)

(assert (=> b!977908 (=> (not res!654486) (not e!551330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977908 (= res!654486 (validKeyInArray!0 (select (arr!29403 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!35879 () Bool)

(declare-fun mapRes!35879 () Bool)

(assert (=> mapIsEmpty!35879 mapRes!35879))

(declare-fun b!977909 () Bool)

(declare-fun res!654490 () Bool)

(assert (=> b!977909 (=> (not res!654490) (not e!551330))))

(assert (=> b!977909 (= res!654490 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!35879 () Bool)

(declare-fun tp!68161 () Bool)

(assert (=> mapNonEmpty!35879 (= mapRes!35879 (and tp!68161 e!551332))))

(declare-fun mapValue!35879 () ValueCell!10802)

(declare-fun mapKey!35879 () (_ BitVec 32))

(declare-fun mapRest!35879 () (Array (_ BitVec 32) ValueCell!10802))

(assert (=> mapNonEmpty!35879 (= (arr!29404 _values!1278) (store mapRest!35879 mapKey!35879 mapValue!35879))))

(declare-fun b!977910 () Bool)

(declare-fun res!654488 () Bool)

(assert (=> b!977910 (=> (not res!654488) (not e!551330))))

(assert (=> b!977910 (= res!654488 (and (= (size!29885 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29884 _keys!1544) (size!29885 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977911 () Bool)

(assert (=> b!977911 (= e!551329 (and e!551333 mapRes!35879))))

(declare-fun condMapEmpty!35879 () Bool)

(declare-fun mapDefault!35879 () ValueCell!10802)

(assert (=> b!977911 (= condMapEmpty!35879 (= (arr!29404 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10802)) mapDefault!35879)))))

(assert (= (and start!83746 res!654492) b!977910))

(assert (= (and b!977910 res!654488) b!977907))

(assert (= (and b!977907 res!654487) b!977902))

(assert (= (and b!977902 res!654491) b!977905))

(assert (= (and b!977905 res!654489) b!977908))

(assert (= (and b!977908 res!654486) b!977909))

(assert (= (and b!977909 res!654490) b!977903))

(assert (= (and b!977911 condMapEmpty!35879) mapIsEmpty!35879))

(assert (= (and b!977911 (not condMapEmpty!35879)) mapNonEmpty!35879))

(get-info :version)

(assert (= (and mapNonEmpty!35879 ((_ is ValueCellFull!10802) mapValue!35879)) b!977904))

(assert (= (and b!977911 ((_ is ValueCellFull!10802) mapDefault!35879)) b!977906))

(assert (= start!83746 b!977911))

(declare-fun b_lambda!14599 () Bool)

(assert (=> (not b_lambda!14599) (not b!977903)))

(declare-fun t!28938 () Bool)

(declare-fun tb!6371 () Bool)

(assert (=> (and start!83746 (= defaultEntry!1281 defaultEntry!1281) t!28938) tb!6371))

(declare-fun result!12739 () Bool)

(assert (=> tb!6371 (= result!12739 tp_is_empty!22567)))

(assert (=> b!977903 t!28938))

(declare-fun b_and!31211 () Bool)

(assert (= b_and!31209 (and (=> t!28938 result!12739) b_and!31211)))

(declare-fun m!904493 () Bool)

(assert (=> start!83746 m!904493))

(declare-fun m!904495 () Bool)

(assert (=> start!83746 m!904495))

(declare-fun m!904497 () Bool)

(assert (=> start!83746 m!904497))

(declare-fun m!904499 () Bool)

(assert (=> mapNonEmpty!35879 m!904499))

(declare-fun m!904501 () Bool)

(assert (=> b!977902 m!904501))

(declare-fun m!904503 () Bool)

(assert (=> b!977903 m!904503))

(declare-fun m!904505 () Bool)

(assert (=> b!977903 m!904505))

(declare-fun m!904507 () Bool)

(assert (=> b!977903 m!904507))

(declare-fun m!904509 () Bool)

(assert (=> b!977903 m!904509))

(declare-fun m!904511 () Bool)

(assert (=> b!977903 m!904511))

(declare-fun m!904513 () Bool)

(assert (=> b!977903 m!904513))

(assert (=> b!977903 m!904511))

(declare-fun m!904515 () Bool)

(assert (=> b!977903 m!904515))

(assert (=> b!977903 m!904503))

(assert (=> b!977903 m!904507))

(declare-fun m!904517 () Bool)

(assert (=> b!977903 m!904517))

(assert (=> b!977903 m!904515))

(declare-fun m!904519 () Bool)

(assert (=> b!977903 m!904519))

(declare-fun m!904521 () Bool)

(assert (=> b!977903 m!904521))

(assert (=> b!977903 m!904509))

(assert (=> b!977903 m!904521))

(declare-fun m!904523 () Bool)

(assert (=> b!977903 m!904523))

(assert (=> b!977908 m!904507))

(assert (=> b!977908 m!904507))

(declare-fun m!904525 () Bool)

(assert (=> b!977908 m!904525))

(declare-fun m!904527 () Bool)

(assert (=> b!977907 m!904527))

(check-sat (not mapNonEmpty!35879) (not b!977903) (not b!977907) (not b!977908) (not b_lambda!14599) (not b!977902) b_and!31211 (not b_next!19573) tp_is_empty!22567 (not start!83746))
(check-sat b_and!31211 (not b_next!19573))
