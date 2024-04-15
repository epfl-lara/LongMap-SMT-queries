; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133900 () Bool)

(assert start!133900)

(declare-fun b_free!32173 () Bool)

(declare-fun b_next!32173 () Bool)

(assert (=> start!133900 (= b_free!32173 (not b_next!32173))))

(declare-fun tp!113821 () Bool)

(declare-fun b_and!51769 () Bool)

(assert (=> start!133900 (= tp!113821 b_and!51769)))

(declare-fun res!1070253 () Bool)

(declare-fun e!872605 () Bool)

(assert (=> start!133900 (=> (not res!1070253) (not e!872605))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133900 (= res!1070253 (validMask!0 mask!947))))

(assert (=> start!133900 e!872605))

(assert (=> start!133900 tp!113821))

(declare-fun tp_is_empty!38947 () Bool)

(assert (=> start!133900 tp_is_empty!38947))

(assert (=> start!133900 true))

(declare-datatypes ((array!104512 0))(
  ( (array!104513 (arr!50444 (Array (_ BitVec 32) (_ BitVec 64))) (size!50996 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104512)

(declare-fun array_inv!39399 (array!104512) Bool)

(assert (=> start!133900 (array_inv!39399 _keys!637)))

(declare-datatypes ((V!60137 0))(
  ( (V!60138 (val!19557 Int)) )
))
(declare-datatypes ((ValueCell!18443 0))(
  ( (ValueCellFull!18443 (v!22309 V!60137)) (EmptyCell!18443) )
))
(declare-datatypes ((array!104514 0))(
  ( (array!104515 (arr!50445 (Array (_ BitVec 32) ValueCell!18443)) (size!50997 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104514)

(declare-fun e!872601 () Bool)

(declare-fun array_inv!39400 (array!104514) Bool)

(assert (=> start!133900 (and (array_inv!39400 _values!487) e!872601)))

(declare-fun b!1565569 () Bool)

(declare-fun e!872604 () Bool)

(declare-fun mapRes!59812 () Bool)

(assert (=> b!1565569 (= e!872601 (and e!872604 mapRes!59812))))

(declare-fun condMapEmpty!59812 () Bool)

(declare-fun mapDefault!59812 () ValueCell!18443)

(assert (=> b!1565569 (= condMapEmpty!59812 (= (arr!50445 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18443)) mapDefault!59812)))))

(declare-fun b!1565570 () Bool)

(declare-fun e!872602 () Bool)

(assert (=> b!1565570 (= e!872602 tp_is_empty!38947)))

(declare-fun b!1565571 () Bool)

(declare-fun res!1070250 () Bool)

(assert (=> b!1565571 (=> (not res!1070250) (not e!872605))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565571 (= res!1070250 (validKeyInArray!0 (select (arr!50444 _keys!637) from!782)))))

(declare-fun b!1565572 () Bool)

(declare-fun res!1070252 () Bool)

(assert (=> b!1565572 (=> (not res!1070252) (not e!872605))))

(assert (=> b!1565572 (= res!1070252 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50996 _keys!637)) (bvslt from!782 (size!50996 _keys!637))))))

(declare-fun b!1565573 () Bool)

(declare-fun res!1070255 () Bool)

(assert (=> b!1565573 (=> (not res!1070255) (not e!872605))))

(declare-datatypes ((List!36669 0))(
  ( (Nil!36666) (Cons!36665 (h!38112 (_ BitVec 64)) (t!51548 List!36669)) )
))
(declare-fun arrayNoDuplicates!0 (array!104512 (_ BitVec 32) List!36669) Bool)

(assert (=> b!1565573 (= res!1070255 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36666))))

(declare-fun b!1565574 () Bool)

(declare-fun res!1070254 () Bool)

(assert (=> b!1565574 (=> (not res!1070254) (not e!872605))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565574 (= res!1070254 (and (= (size!50997 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50996 _keys!637) (size!50997 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565575 () Bool)

(declare-fun e!872603 () Bool)

(assert (=> b!1565575 (= e!872603 (bvslt from!782 (size!50997 _values!487)))))

(declare-fun b!1565576 () Bool)

(assert (=> b!1565576 (= e!872604 tp_is_empty!38947)))

(declare-fun b!1565577 () Bool)

(declare-fun res!1070251 () Bool)

(assert (=> b!1565577 (=> res!1070251 e!872603)))

(declare-datatypes ((tuple2!25310 0))(
  ( (tuple2!25311 (_1!12666 (_ BitVec 64)) (_2!12666 V!60137)) )
))
(declare-datatypes ((List!36670 0))(
  ( (Nil!36667) (Cons!36666 (h!38113 tuple2!25310) (t!51549 List!36670)) )
))
(declare-datatypes ((ListLongMap!22745 0))(
  ( (ListLongMap!22746 (toList!11388 List!36670)) )
))
(declare-fun lt!672175 () ListLongMap!22745)

(declare-fun contains!10301 (ListLongMap!22745 (_ BitVec 64)) Bool)

(assert (=> b!1565577 (= res!1070251 (not (contains!10301 lt!672175 (select (arr!50444 _keys!637) from!782))))))

(declare-fun b!1565578 () Bool)

(declare-fun res!1070256 () Bool)

(assert (=> b!1565578 (=> (not res!1070256) (not e!872605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104512 (_ BitVec 32)) Bool)

(assert (=> b!1565578 (= res!1070256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565579 () Bool)

(assert (=> b!1565579 (= e!872605 (not e!872603))))

(declare-fun res!1070257 () Bool)

(assert (=> b!1565579 (=> res!1070257 e!872603)))

(assert (=> b!1565579 (= res!1070257 (contains!10301 lt!672175 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565579 (not (contains!10301 lt!672175 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672172 () ListLongMap!22745)

(declare-fun lt!672173 () V!60137)

(declare-fun +!5109 (ListLongMap!22745 tuple2!25310) ListLongMap!22745)

(assert (=> b!1565579 (= lt!672175 (+!5109 lt!672172 (tuple2!25311 (select (arr!50444 _keys!637) from!782) lt!672173)))))

(declare-datatypes ((Unit!51836 0))(
  ( (Unit!51837) )
))
(declare-fun lt!672174 () Unit!51836)

(declare-fun addStillNotContains!556 (ListLongMap!22745 (_ BitVec 64) V!60137 (_ BitVec 64)) Unit!51836)

(assert (=> b!1565579 (= lt!672174 (addStillNotContains!556 lt!672172 (select (arr!50444 _keys!637) from!782) lt!672173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26350 (ValueCell!18443 V!60137) V!60137)

(declare-fun dynLambda!3885 (Int (_ BitVec 64)) V!60137)

(assert (=> b!1565579 (= lt!672173 (get!26350 (select (arr!50445 _values!487) from!782) (dynLambda!3885 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60137)

(declare-fun minValue!453 () V!60137)

(declare-fun getCurrentListMapNoExtraKeys!6740 (array!104512 array!104514 (_ BitVec 32) (_ BitVec 32) V!60137 V!60137 (_ BitVec 32) Int) ListLongMap!22745)

(assert (=> b!1565579 (= lt!672172 (getCurrentListMapNoExtraKeys!6740 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59812 () Bool)

(declare-fun tp!113822 () Bool)

(assert (=> mapNonEmpty!59812 (= mapRes!59812 (and tp!113822 e!872602))))

(declare-fun mapValue!59812 () ValueCell!18443)

(declare-fun mapRest!59812 () (Array (_ BitVec 32) ValueCell!18443))

(declare-fun mapKey!59812 () (_ BitVec 32))

(assert (=> mapNonEmpty!59812 (= (arr!50445 _values!487) (store mapRest!59812 mapKey!59812 mapValue!59812))))

(declare-fun mapIsEmpty!59812 () Bool)

(assert (=> mapIsEmpty!59812 mapRes!59812))

(assert (= (and start!133900 res!1070253) b!1565574))

(assert (= (and b!1565574 res!1070254) b!1565578))

(assert (= (and b!1565578 res!1070256) b!1565573))

(assert (= (and b!1565573 res!1070255) b!1565572))

(assert (= (and b!1565572 res!1070252) b!1565571))

(assert (= (and b!1565571 res!1070250) b!1565579))

(assert (= (and b!1565579 (not res!1070257)) b!1565577))

(assert (= (and b!1565577 (not res!1070251)) b!1565575))

(assert (= (and b!1565569 condMapEmpty!59812) mapIsEmpty!59812))

(assert (= (and b!1565569 (not condMapEmpty!59812)) mapNonEmpty!59812))

(get-info :version)

(assert (= (and mapNonEmpty!59812 ((_ is ValueCellFull!18443) mapValue!59812)) b!1565570))

(assert (= (and b!1565569 ((_ is ValueCellFull!18443) mapDefault!59812)) b!1565576))

(assert (= start!133900 b!1565569))

(declare-fun b_lambda!24977 () Bool)

(assert (=> (not b_lambda!24977) (not b!1565579)))

(declare-fun t!51547 () Bool)

(declare-fun tb!12633 () Bool)

(assert (=> (and start!133900 (= defaultEntry!495 defaultEntry!495) t!51547) tb!12633))

(declare-fun result!26565 () Bool)

(assert (=> tb!12633 (= result!26565 tp_is_empty!38947)))

(assert (=> b!1565579 t!51547))

(declare-fun b_and!51771 () Bool)

(assert (= b_and!51769 (and (=> t!51547 result!26565) b_and!51771)))

(declare-fun m!1439917 () Bool)

(assert (=> b!1565579 m!1439917))

(declare-fun m!1439919 () Bool)

(assert (=> b!1565579 m!1439919))

(declare-fun m!1439921 () Bool)

(assert (=> b!1565579 m!1439921))

(declare-fun m!1439923 () Bool)

(assert (=> b!1565579 m!1439923))

(assert (=> b!1565579 m!1439917))

(declare-fun m!1439925 () Bool)

(assert (=> b!1565579 m!1439925))

(declare-fun m!1439927 () Bool)

(assert (=> b!1565579 m!1439927))

(declare-fun m!1439929 () Bool)

(assert (=> b!1565579 m!1439929))

(assert (=> b!1565579 m!1439925))

(declare-fun m!1439931 () Bool)

(assert (=> b!1565579 m!1439931))

(assert (=> b!1565579 m!1439919))

(declare-fun m!1439933 () Bool)

(assert (=> b!1565579 m!1439933))

(declare-fun m!1439935 () Bool)

(assert (=> mapNonEmpty!59812 m!1439935))

(declare-fun m!1439937 () Bool)

(assert (=> b!1565573 m!1439937))

(assert (=> b!1565577 m!1439925))

(assert (=> b!1565577 m!1439925))

(declare-fun m!1439939 () Bool)

(assert (=> b!1565577 m!1439939))

(declare-fun m!1439941 () Bool)

(assert (=> start!133900 m!1439941))

(declare-fun m!1439943 () Bool)

(assert (=> start!133900 m!1439943))

(declare-fun m!1439945 () Bool)

(assert (=> start!133900 m!1439945))

(declare-fun m!1439947 () Bool)

(assert (=> b!1565578 m!1439947))

(assert (=> b!1565571 m!1439925))

(assert (=> b!1565571 m!1439925))

(declare-fun m!1439949 () Bool)

(assert (=> b!1565571 m!1439949))

(check-sat b_and!51771 (not b!1565573) (not b!1565578) tp_is_empty!38947 (not b!1565571) (not b_lambda!24977) (not start!133900) (not mapNonEmpty!59812) (not b_next!32173) (not b!1565579) (not b!1565577))
(check-sat b_and!51771 (not b_next!32173))
