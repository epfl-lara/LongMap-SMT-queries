; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134006 () Bool)

(assert start!134006)

(declare-fun b_free!32011 () Bool)

(declare-fun b_next!32011 () Bool)

(assert (=> start!134006 (= b_free!32011 (not b_next!32011))))

(declare-fun tp!113156 () Bool)

(declare-fun b_and!51535 () Bool)

(assert (=> start!134006 (= tp!113156 b_and!51535)))

(declare-fun b!1564380 () Bool)

(declare-fun e!871923 () Bool)

(declare-fun tp_is_empty!38677 () Bool)

(assert (=> b!1564380 (= e!871923 tp_is_empty!38677)))

(declare-fun b!1564381 () Bool)

(declare-fun res!1068801 () Bool)

(declare-fun e!871927 () Bool)

(assert (=> b!1564381 (=> (not res!1068801) (not e!871927))))

(declare-datatypes ((array!104186 0))(
  ( (array!104187 (arr!50278 (Array (_ BitVec 32) (_ BitVec 64))) (size!50829 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104186)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564381 (= res!1068801 (validKeyInArray!0 (select (arr!50278 _keys!637) from!782)))))

(declare-fun b!1564382 () Bool)

(declare-fun res!1068804 () Bool)

(assert (=> b!1564382 (=> (not res!1068804) (not e!871927))))

(declare-datatypes ((List!36492 0))(
  ( (Nil!36489) (Cons!36488 (h!37952 (_ BitVec 64)) (t!51285 List!36492)) )
))
(declare-fun arrayNoDuplicates!0 (array!104186 (_ BitVec 32) List!36492) Bool)

(assert (=> b!1564382 (= res!1068804 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36489))))

(declare-fun b!1564383 () Bool)

(declare-fun res!1068802 () Bool)

(assert (=> b!1564383 (=> (not res!1068802) (not e!871927))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59777 0))(
  ( (V!59778 (val!19422 Int)) )
))
(declare-datatypes ((ValueCell!18308 0))(
  ( (ValueCellFull!18308 (v!22166 V!59777)) (EmptyCell!18308) )
))
(declare-datatypes ((array!104188 0))(
  ( (array!104189 (arr!50279 (Array (_ BitVec 32) ValueCell!18308)) (size!50830 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104188)

(declare-fun mask!947 () (_ BitVec 32))

(assert (=> b!1564383 (= res!1068802 (and (= (size!50830 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50829 _keys!637) (size!50830 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564384 () Bool)

(declare-fun e!871925 () Bool)

(assert (=> b!1564384 (= e!871925 tp_is_empty!38677)))

(declare-fun b!1564385 () Bool)

(declare-fun e!871926 () Bool)

(declare-fun mapRes!59391 () Bool)

(assert (=> b!1564385 (= e!871926 (and e!871925 mapRes!59391))))

(declare-fun condMapEmpty!59391 () Bool)

(declare-fun mapDefault!59391 () ValueCell!18308)

(assert (=> b!1564385 (= condMapEmpty!59391 (= (arr!50279 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18308)) mapDefault!59391)))))

(declare-fun b!1564386 () Bool)

(declare-fun res!1068803 () Bool)

(assert (=> b!1564386 (=> (not res!1068803) (not e!871927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104186 (_ BitVec 32)) Bool)

(assert (=> b!1564386 (= res!1068803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564387 () Bool)

(declare-fun res!1068806 () Bool)

(assert (=> b!1564387 (=> (not res!1068806) (not e!871927))))

(assert (=> b!1564387 (= res!1068806 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50829 _keys!637)) (bvslt from!782 (size!50829 _keys!637))))))

(declare-fun mapIsEmpty!59391 () Bool)

(assert (=> mapIsEmpty!59391 mapRes!59391))

(declare-fun res!1068805 () Bool)

(assert (=> start!134006 (=> (not res!1068805) (not e!871927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134006 (= res!1068805 (validMask!0 mask!947))))

(assert (=> start!134006 e!871927))

(assert (=> start!134006 tp!113156))

(assert (=> start!134006 tp_is_empty!38677))

(assert (=> start!134006 true))

(declare-fun array_inv!39327 (array!104186) Bool)

(assert (=> start!134006 (array_inv!39327 _keys!637)))

(declare-fun array_inv!39328 (array!104188) Bool)

(assert (=> start!134006 (and (array_inv!39328 _values!487) e!871926)))

(declare-fun mapNonEmpty!59391 () Bool)

(declare-fun tp!113157 () Bool)

(assert (=> mapNonEmpty!59391 (= mapRes!59391 (and tp!113157 e!871923))))

(declare-fun mapRest!59391 () (Array (_ BitVec 32) ValueCell!18308))

(declare-fun mapValue!59391 () ValueCell!18308)

(declare-fun mapKey!59391 () (_ BitVec 32))

(assert (=> mapNonEmpty!59391 (= (arr!50279 _values!487) (store mapRest!59391 mapKey!59391 mapValue!59391))))

(declare-fun b!1564388 () Bool)

(assert (=> b!1564388 (= e!871927 (not true))))

(declare-fun lt!672313 () Bool)

(declare-datatypes ((tuple2!25152 0))(
  ( (tuple2!25153 (_1!12587 (_ BitVec 64)) (_2!12587 V!59777)) )
))
(declare-datatypes ((List!36493 0))(
  ( (Nil!36490) (Cons!36489 (h!37953 tuple2!25152) (t!51286 List!36493)) )
))
(declare-datatypes ((ListLongMap!22595 0))(
  ( (ListLongMap!22596 (toList!11313 List!36493)) )
))
(declare-fun lt!672316 () ListLongMap!22595)

(declare-fun contains!10314 (ListLongMap!22595 (_ BitVec 64)) Bool)

(assert (=> b!1564388 (= lt!672313 (contains!10314 lt!672316 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1564388 (not (contains!10314 lt!672316 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672317 () V!59777)

(declare-fun lt!672315 () ListLongMap!22595)

(declare-fun +!5089 (ListLongMap!22595 tuple2!25152) ListLongMap!22595)

(assert (=> b!1564388 (= lt!672316 (+!5089 lt!672315 (tuple2!25153 (select (arr!50278 _keys!637) from!782) lt!672317)))))

(declare-datatypes ((Unit!51863 0))(
  ( (Unit!51864) )
))
(declare-fun lt!672314 () Unit!51863)

(declare-fun addStillNotContains!540 (ListLongMap!22595 (_ BitVec 64) V!59777 (_ BitVec 64)) Unit!51863)

(assert (=> b!1564388 (= lt!672314 (addStillNotContains!540 lt!672315 (select (arr!50278 _keys!637) from!782) lt!672317 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26271 (ValueCell!18308 V!59777) V!59777)

(declare-fun dynLambda!3887 (Int (_ BitVec 64)) V!59777)

(assert (=> b!1564388 (= lt!672317 (get!26271 (select (arr!50279 _values!487) from!782) (dynLambda!3887 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!453 () V!59777)

(declare-fun zeroValue!453 () V!59777)

(declare-fun getCurrentListMapNoExtraKeys!6712 (array!104186 array!104188 (_ BitVec 32) (_ BitVec 32) V!59777 V!59777 (_ BitVec 32) Int) ListLongMap!22595)

(assert (=> b!1564388 (= lt!672315 (getCurrentListMapNoExtraKeys!6712 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(assert (= (and start!134006 res!1068805) b!1564383))

(assert (= (and b!1564383 res!1068802) b!1564386))

(assert (= (and b!1564386 res!1068803) b!1564382))

(assert (= (and b!1564382 res!1068804) b!1564387))

(assert (= (and b!1564387 res!1068806) b!1564381))

(assert (= (and b!1564381 res!1068801) b!1564388))

(assert (= (and b!1564385 condMapEmpty!59391) mapIsEmpty!59391))

(assert (= (and b!1564385 (not condMapEmpty!59391)) mapNonEmpty!59391))

(get-info :version)

(assert (= (and mapNonEmpty!59391 ((_ is ValueCellFull!18308) mapValue!59391)) b!1564380))

(assert (= (and b!1564385 ((_ is ValueCellFull!18308) mapDefault!59391)) b!1564384))

(assert (= start!134006 b!1564385))

(declare-fun b_lambda!24879 () Bool)

(assert (=> (not b_lambda!24879) (not b!1564388)))

(declare-fun t!51284 () Bool)

(declare-fun tb!12547 () Bool)

(assert (=> (and start!134006 (= defaultEntry!495 defaultEntry!495) t!51284) tb!12547))

(declare-fun result!26383 () Bool)

(assert (=> tb!12547 (= result!26383 tp_is_empty!38677)))

(assert (=> b!1564388 t!51284))

(declare-fun b_and!51537 () Bool)

(assert (= b_and!51535 (and (=> t!51284 result!26383) b_and!51537)))

(declare-fun m!1439907 () Bool)

(assert (=> mapNonEmpty!59391 m!1439907))

(declare-fun m!1439909 () Bool)

(assert (=> start!134006 m!1439909))

(declare-fun m!1439911 () Bool)

(assert (=> start!134006 m!1439911))

(declare-fun m!1439913 () Bool)

(assert (=> start!134006 m!1439913))

(declare-fun m!1439915 () Bool)

(assert (=> b!1564386 m!1439915))

(declare-fun m!1439917 () Bool)

(assert (=> b!1564381 m!1439917))

(assert (=> b!1564381 m!1439917))

(declare-fun m!1439919 () Bool)

(assert (=> b!1564381 m!1439919))

(declare-fun m!1439921 () Bool)

(assert (=> b!1564388 m!1439921))

(declare-fun m!1439923 () Bool)

(assert (=> b!1564388 m!1439923))

(declare-fun m!1439925 () Bool)

(assert (=> b!1564388 m!1439925))

(declare-fun m!1439927 () Bool)

(assert (=> b!1564388 m!1439927))

(assert (=> b!1564388 m!1439921))

(declare-fun m!1439929 () Bool)

(assert (=> b!1564388 m!1439929))

(assert (=> b!1564388 m!1439917))

(assert (=> b!1564388 m!1439917))

(declare-fun m!1439931 () Bool)

(assert (=> b!1564388 m!1439931))

(declare-fun m!1439933 () Bool)

(assert (=> b!1564388 m!1439933))

(assert (=> b!1564388 m!1439923))

(declare-fun m!1439935 () Bool)

(assert (=> b!1564388 m!1439935))

(declare-fun m!1439937 () Bool)

(assert (=> b!1564382 m!1439937))

(check-sat (not start!134006) (not b_lambda!24879) (not b!1564386) (not b!1564381) (not b!1564388) tp_is_empty!38677 b_and!51537 (not b_next!32011) (not b!1564382) (not mapNonEmpty!59391))
(check-sat b_and!51537 (not b_next!32011))
