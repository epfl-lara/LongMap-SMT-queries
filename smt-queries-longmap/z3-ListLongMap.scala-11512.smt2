; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133906 () Bool)

(assert start!133906)

(declare-fun b_free!32179 () Bool)

(declare-fun b_next!32179 () Bool)

(assert (=> start!133906 (= b_free!32179 (not b_next!32179))))

(declare-fun tp!113839 () Bool)

(declare-fun b_and!51781 () Bool)

(assert (=> start!133906 (= tp!113839 b_and!51781)))

(declare-fun b!1565670 () Bool)

(declare-fun res!1070320 () Bool)

(declare-fun e!872654 () Bool)

(assert (=> b!1565670 (=> (not res!1070320) (not e!872654))))

(declare-datatypes ((array!104522 0))(
  ( (array!104523 (arr!50449 (Array (_ BitVec 32) (_ BitVec 64))) (size!51001 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104522)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565670 (= res!1070320 (validKeyInArray!0 (select (arr!50449 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59821 () Bool)

(declare-fun mapRes!59821 () Bool)

(assert (=> mapIsEmpty!59821 mapRes!59821))

(declare-fun res!1070323 () Bool)

(assert (=> start!133906 (=> (not res!1070323) (not e!872654))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133906 (= res!1070323 (validMask!0 mask!947))))

(assert (=> start!133906 e!872654))

(assert (=> start!133906 tp!113839))

(declare-fun tp_is_empty!38953 () Bool)

(assert (=> start!133906 tp_is_empty!38953))

(assert (=> start!133906 true))

(declare-fun array_inv!39403 (array!104522) Bool)

(assert (=> start!133906 (array_inv!39403 _keys!637)))

(declare-datatypes ((V!60145 0))(
  ( (V!60146 (val!19560 Int)) )
))
(declare-datatypes ((ValueCell!18446 0))(
  ( (ValueCellFull!18446 (v!22312 V!60145)) (EmptyCell!18446) )
))
(declare-datatypes ((array!104524 0))(
  ( (array!104525 (arr!50450 (Array (_ BitVec 32) ValueCell!18446)) (size!51002 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104524)

(declare-fun e!872656 () Bool)

(declare-fun array_inv!39404 (array!104524) Bool)

(assert (=> start!133906 (and (array_inv!39404 _values!487) e!872656)))

(declare-fun mapNonEmpty!59821 () Bool)

(declare-fun tp!113840 () Bool)

(declare-fun e!872653 () Bool)

(assert (=> mapNonEmpty!59821 (= mapRes!59821 (and tp!113840 e!872653))))

(declare-fun mapValue!59821 () ValueCell!18446)

(declare-fun mapKey!59821 () (_ BitVec 32))

(declare-fun mapRest!59821 () (Array (_ BitVec 32) ValueCell!18446))

(assert (=> mapNonEmpty!59821 (= (arr!50450 _values!487) (store mapRest!59821 mapKey!59821 mapValue!59821))))

(declare-fun b!1565671 () Bool)

(assert (=> b!1565671 (= e!872653 tp_is_empty!38953)))

(declare-fun b!1565672 () Bool)

(assert (=> b!1565672 (= e!872654 (not true))))

(declare-fun lt!672212 () Bool)

(declare-datatypes ((tuple2!25314 0))(
  ( (tuple2!25315 (_1!12668 (_ BitVec 64)) (_2!12668 V!60145)) )
))
(declare-datatypes ((List!36673 0))(
  ( (Nil!36670) (Cons!36669 (h!38116 tuple2!25314) (t!51558 List!36673)) )
))
(declare-datatypes ((ListLongMap!22749 0))(
  ( (ListLongMap!22750 (toList!11390 List!36673)) )
))
(declare-fun lt!672210 () ListLongMap!22749)

(declare-fun contains!10303 (ListLongMap!22749 (_ BitVec 64)) Bool)

(assert (=> b!1565672 (= lt!672212 (contains!10303 lt!672210 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565672 (not (contains!10303 lt!672210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672213 () V!60145)

(declare-fun lt!672214 () ListLongMap!22749)

(declare-fun +!5111 (ListLongMap!22749 tuple2!25314) ListLongMap!22749)

(assert (=> b!1565672 (= lt!672210 (+!5111 lt!672214 (tuple2!25315 (select (arr!50449 _keys!637) from!782) lt!672213)))))

(declare-datatypes ((Unit!51840 0))(
  ( (Unit!51841) )
))
(declare-fun lt!672211 () Unit!51840)

(declare-fun addStillNotContains!558 (ListLongMap!22749 (_ BitVec 64) V!60145 (_ BitVec 64)) Unit!51840)

(assert (=> b!1565672 (= lt!672211 (addStillNotContains!558 lt!672214 (select (arr!50449 _keys!637) from!782) lt!672213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26354 (ValueCell!18446 V!60145) V!60145)

(declare-fun dynLambda!3887 (Int (_ BitVec 64)) V!60145)

(assert (=> b!1565672 (= lt!672213 (get!26354 (select (arr!50450 _values!487) from!782) (dynLambda!3887 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60145)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60145)

(declare-fun getCurrentListMapNoExtraKeys!6742 (array!104522 array!104524 (_ BitVec 32) (_ BitVec 32) V!60145 V!60145 (_ BitVec 32) Int) ListLongMap!22749)

(assert (=> b!1565672 (= lt!672214 (getCurrentListMapNoExtraKeys!6742 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565673 () Bool)

(declare-fun e!872652 () Bool)

(assert (=> b!1565673 (= e!872652 tp_is_empty!38953)))

(declare-fun b!1565674 () Bool)

(declare-fun res!1070319 () Bool)

(assert (=> b!1565674 (=> (not res!1070319) (not e!872654))))

(assert (=> b!1565674 (= res!1070319 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51001 _keys!637)) (bvslt from!782 (size!51001 _keys!637))))))

(declare-fun b!1565675 () Bool)

(declare-fun res!1070322 () Bool)

(assert (=> b!1565675 (=> (not res!1070322) (not e!872654))))

(assert (=> b!1565675 (= res!1070322 (and (= (size!51002 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51001 _keys!637) (size!51002 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565676 () Bool)

(assert (=> b!1565676 (= e!872656 (and e!872652 mapRes!59821))))

(declare-fun condMapEmpty!59821 () Bool)

(declare-fun mapDefault!59821 () ValueCell!18446)

(assert (=> b!1565676 (= condMapEmpty!59821 (= (arr!50450 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18446)) mapDefault!59821)))))

(declare-fun b!1565677 () Bool)

(declare-fun res!1070318 () Bool)

(assert (=> b!1565677 (=> (not res!1070318) (not e!872654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104522 (_ BitVec 32)) Bool)

(assert (=> b!1565677 (= res!1070318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565678 () Bool)

(declare-fun res!1070321 () Bool)

(assert (=> b!1565678 (=> (not res!1070321) (not e!872654))))

(declare-datatypes ((List!36674 0))(
  ( (Nil!36671) (Cons!36670 (h!38117 (_ BitVec 64)) (t!51559 List!36674)) )
))
(declare-fun arrayNoDuplicates!0 (array!104522 (_ BitVec 32) List!36674) Bool)

(assert (=> b!1565678 (= res!1070321 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36671))))

(assert (= (and start!133906 res!1070323) b!1565675))

(assert (= (and b!1565675 res!1070322) b!1565677))

(assert (= (and b!1565677 res!1070318) b!1565678))

(assert (= (and b!1565678 res!1070321) b!1565674))

(assert (= (and b!1565674 res!1070319) b!1565670))

(assert (= (and b!1565670 res!1070320) b!1565672))

(assert (= (and b!1565676 condMapEmpty!59821) mapIsEmpty!59821))

(assert (= (and b!1565676 (not condMapEmpty!59821)) mapNonEmpty!59821))

(get-info :version)

(assert (= (and mapNonEmpty!59821 ((_ is ValueCellFull!18446) mapValue!59821)) b!1565671))

(assert (= (and b!1565676 ((_ is ValueCellFull!18446) mapDefault!59821)) b!1565673))

(assert (= start!133906 b!1565676))

(declare-fun b_lambda!24983 () Bool)

(assert (=> (not b_lambda!24983) (not b!1565672)))

(declare-fun t!51557 () Bool)

(declare-fun tb!12639 () Bool)

(assert (=> (and start!133906 (= defaultEntry!495 defaultEntry!495) t!51557) tb!12639))

(declare-fun result!26577 () Bool)

(assert (=> tb!12639 (= result!26577 tp_is_empty!38953)))

(assert (=> b!1565672 t!51557))

(declare-fun b_and!51783 () Bool)

(assert (= b_and!51781 (and (=> t!51557 result!26577) b_and!51783)))

(declare-fun m!1440019 () Bool)

(assert (=> mapNonEmpty!59821 m!1440019))

(declare-fun m!1440021 () Bool)

(assert (=> b!1565672 m!1440021))

(declare-fun m!1440023 () Bool)

(assert (=> b!1565672 m!1440023))

(declare-fun m!1440025 () Bool)

(assert (=> b!1565672 m!1440025))

(declare-fun m!1440027 () Bool)

(assert (=> b!1565672 m!1440027))

(assert (=> b!1565672 m!1440021))

(declare-fun m!1440029 () Bool)

(assert (=> b!1565672 m!1440029))

(declare-fun m!1440031 () Bool)

(assert (=> b!1565672 m!1440031))

(assert (=> b!1565672 m!1440023))

(declare-fun m!1440033 () Bool)

(assert (=> b!1565672 m!1440033))

(assert (=> b!1565672 m!1440029))

(declare-fun m!1440035 () Bool)

(assert (=> b!1565672 m!1440035))

(declare-fun m!1440037 () Bool)

(assert (=> b!1565672 m!1440037))

(assert (=> b!1565670 m!1440029))

(assert (=> b!1565670 m!1440029))

(declare-fun m!1440039 () Bool)

(assert (=> b!1565670 m!1440039))

(declare-fun m!1440041 () Bool)

(assert (=> start!133906 m!1440041))

(declare-fun m!1440043 () Bool)

(assert (=> start!133906 m!1440043))

(declare-fun m!1440045 () Bool)

(assert (=> start!133906 m!1440045))

(declare-fun m!1440047 () Bool)

(assert (=> b!1565678 m!1440047))

(declare-fun m!1440049 () Bool)

(assert (=> b!1565677 m!1440049))

(check-sat (not b!1565672) (not b!1565677) (not b!1565678) (not b_next!32179) (not b!1565670) (not start!133906) (not mapNonEmpty!59821) (not b_lambda!24983) b_and!51783 tp_is_empty!38953)
(check-sat b_and!51783 (not b_next!32179))
