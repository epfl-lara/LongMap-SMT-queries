; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83454 () Bool)

(assert start!83454)

(declare-fun b_free!19279 () Bool)

(declare-fun b_next!19279 () Bool)

(assert (=> start!83454 (= b_free!19279 (not b_next!19279))))

(declare-fun tp!67116 () Bool)

(declare-fun b_and!30789 () Bool)

(assert (=> start!83454 (= tp!67116 b_and!30789)))

(declare-fun mapNonEmpty!35275 () Bool)

(declare-fun mapRes!35275 () Bool)

(declare-fun tp!67117 () Bool)

(declare-fun e!548492 () Bool)

(assert (=> mapNonEmpty!35275 (= mapRes!35275 (and tp!67117 e!548492))))

(declare-datatypes ((V!34553 0))(
  ( (V!34554 (val!11139 Int)) )
))
(declare-datatypes ((ValueCell!10607 0))(
  ( (ValueCellFull!10607 (v!13695 V!34553)) (EmptyCell!10607) )
))
(declare-datatypes ((array!60426 0))(
  ( (array!60427 (arr!29072 (Array (_ BitVec 32) ValueCell!10607)) (size!29552 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60426)

(declare-fun mapKey!35275 () (_ BitVec 32))

(declare-fun mapValue!35275 () ValueCell!10607)

(declare-fun mapRest!35275 () (Array (_ BitVec 32) ValueCell!10607))

(assert (=> mapNonEmpty!35275 (= (arr!29072 _values!1425) (store mapRest!35275 mapKey!35275 mapValue!35275))))

(declare-fun mapIsEmpty!35275 () Bool)

(assert (=> mapIsEmpty!35275 mapRes!35275))

(declare-fun b!972924 () Bool)

(declare-fun e!548496 () Bool)

(declare-fun tp_is_empty!22177 () Bool)

(assert (=> b!972924 (= e!548496 tp_is_empty!22177)))

(declare-fun b!972925 () Bool)

(declare-fun e!548494 () Bool)

(assert (=> b!972925 (= e!548494 (not true))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun lt!432290 () (_ BitVec 64))

(declare-fun zeroValue!1367 () V!34553)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((tuple2!14288 0))(
  ( (tuple2!14289 (_1!7155 (_ BitVec 64)) (_2!7155 V!34553)) )
))
(declare-datatypes ((List!20140 0))(
  ( (Nil!20137) (Cons!20136 (h!21304 tuple2!14288) (t!28509 List!20140)) )
))
(declare-datatypes ((ListLongMap!12987 0))(
  ( (ListLongMap!12988 (toList!6509 List!20140)) )
))
(declare-fun lt!432291 () ListLongMap!12987)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60428 0))(
  ( (array!60429 (arr!29073 (Array (_ BitVec 32) (_ BitVec 64))) (size!29553 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60428)

(declare-fun minValue!1367 () V!34553)

(declare-fun +!2889 (ListLongMap!12987 tuple2!14288) ListLongMap!12987)

(declare-fun getCurrentListMap!3742 (array!60428 array!60426 (_ BitVec 32) (_ BitVec 32) V!34553 V!34553 (_ BitVec 32) Int) ListLongMap!12987)

(declare-fun get!15074 (ValueCell!10607 V!34553) V!34553)

(declare-fun dynLambda!1686 (Int (_ BitVec 64)) V!34553)

(assert (=> b!972925 (= lt!432291 (+!2889 (getCurrentListMap!3742 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14289 lt!432290 (get!15074 (select (arr!29072 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1686 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32342 0))(
  ( (Unit!32343) )
))
(declare-fun lt!432289 () Unit!32342)

(declare-fun lemmaListMapRecursiveValidKeyArray!245 (array!60428 array!60426 (_ BitVec 32) (_ BitVec 32) V!34553 V!34553 (_ BitVec 32) Int) Unit!32342)

(assert (=> b!972925 (= lt!432289 (lemmaListMapRecursiveValidKeyArray!245 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972926 () Bool)

(declare-fun e!548495 () Bool)

(assert (=> b!972926 (= e!548495 (and e!548496 mapRes!35275))))

(declare-fun condMapEmpty!35275 () Bool)

(declare-fun mapDefault!35275 () ValueCell!10607)

(assert (=> b!972926 (= condMapEmpty!35275 (= (arr!29072 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10607)) mapDefault!35275)))))

(declare-fun b!972927 () Bool)

(declare-fun res!650971 () Bool)

(declare-fun e!548493 () Bool)

(assert (=> b!972927 (=> (not res!650971) (not e!548493))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972927 (= res!650971 (validKeyInArray!0 (select (arr!29073 _keys!1717) i!822)))))

(declare-fun b!972928 () Bool)

(declare-fun res!650967 () Bool)

(assert (=> b!972928 (=> (not res!650967) (not e!548493))))

(declare-fun contains!5622 (ListLongMap!12987 (_ BitVec 64)) Bool)

(assert (=> b!972928 (= res!650967 (contains!5622 (getCurrentListMap!3742 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29073 _keys!1717) i!822)))))

(declare-fun res!650970 () Bool)

(assert (=> start!83454 (=> (not res!650970) (not e!548493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83454 (= res!650970 (validMask!0 mask!2147))))

(assert (=> start!83454 e!548493))

(assert (=> start!83454 true))

(declare-fun array_inv!22547 (array!60426) Bool)

(assert (=> start!83454 (and (array_inv!22547 _values!1425) e!548495)))

(assert (=> start!83454 tp_is_empty!22177))

(assert (=> start!83454 tp!67116))

(declare-fun array_inv!22548 (array!60428) Bool)

(assert (=> start!83454 (array_inv!22548 _keys!1717)))

(declare-fun b!972929 () Bool)

(declare-fun res!650968 () Bool)

(assert (=> b!972929 (=> (not res!650968) (not e!548493))))

(assert (=> b!972929 (= res!650968 (and (= (size!29552 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29553 _keys!1717) (size!29552 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972930 () Bool)

(declare-fun res!650972 () Bool)

(assert (=> b!972930 (=> (not res!650972) (not e!548493))))

(assert (=> b!972930 (= res!650972 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29553 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29553 _keys!1717))))))

(declare-fun b!972931 () Bool)

(assert (=> b!972931 (= e!548492 tp_is_empty!22177)))

(declare-fun b!972932 () Bool)

(declare-fun res!650969 () Bool)

(assert (=> b!972932 (=> (not res!650969) (not e!548493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60428 (_ BitVec 32)) Bool)

(assert (=> b!972932 (= res!650969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972933 () Bool)

(assert (=> b!972933 (= e!548493 e!548494)))

(declare-fun res!650965 () Bool)

(assert (=> b!972933 (=> (not res!650965) (not e!548494))))

(assert (=> b!972933 (= res!650965 (validKeyInArray!0 lt!432290))))

(assert (=> b!972933 (= lt!432290 (select (arr!29073 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!972933 (= lt!432291 (getCurrentListMap!3742 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972934 () Bool)

(declare-fun res!650966 () Bool)

(assert (=> b!972934 (=> (not res!650966) (not e!548493))))

(declare-datatypes ((List!20141 0))(
  ( (Nil!20138) (Cons!20137 (h!21305 (_ BitVec 64)) (t!28510 List!20141)) )
))
(declare-fun arrayNoDuplicates!0 (array!60428 (_ BitVec 32) List!20141) Bool)

(assert (=> b!972934 (= res!650966 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20138))))

(assert (= (and start!83454 res!650970) b!972929))

(assert (= (and b!972929 res!650968) b!972932))

(assert (= (and b!972932 res!650969) b!972934))

(assert (= (and b!972934 res!650966) b!972930))

(assert (= (and b!972930 res!650972) b!972927))

(assert (= (and b!972927 res!650971) b!972928))

(assert (= (and b!972928 res!650967) b!972933))

(assert (= (and b!972933 res!650965) b!972925))

(assert (= (and b!972926 condMapEmpty!35275) mapIsEmpty!35275))

(assert (= (and b!972926 (not condMapEmpty!35275)) mapNonEmpty!35275))

(get-info :version)

(assert (= (and mapNonEmpty!35275 ((_ is ValueCellFull!10607) mapValue!35275)) b!972931))

(assert (= (and b!972926 ((_ is ValueCellFull!10607) mapDefault!35275)) b!972924))

(assert (= start!83454 b!972926))

(declare-fun b_lambda!14457 () Bool)

(assert (=> (not b_lambda!14457) (not b!972925)))

(declare-fun t!28508 () Bool)

(declare-fun tb!6219 () Bool)

(assert (=> (and start!83454 (= defaultEntry!1428 defaultEntry!1428) t!28508) tb!6219))

(declare-fun result!12423 () Bool)

(assert (=> tb!6219 (= result!12423 tp_is_empty!22177)))

(assert (=> b!972925 t!28508))

(declare-fun b_and!30791 () Bool)

(assert (= b_and!30789 (and (=> t!28508 result!12423) b_and!30791)))

(declare-fun m!900689 () Bool)

(assert (=> start!83454 m!900689))

(declare-fun m!900691 () Bool)

(assert (=> start!83454 m!900691))

(declare-fun m!900693 () Bool)

(assert (=> start!83454 m!900693))

(declare-fun m!900695 () Bool)

(assert (=> b!972928 m!900695))

(declare-fun m!900697 () Bool)

(assert (=> b!972928 m!900697))

(assert (=> b!972928 m!900695))

(assert (=> b!972928 m!900697))

(declare-fun m!900699 () Bool)

(assert (=> b!972928 m!900699))

(declare-fun m!900701 () Bool)

(assert (=> b!972932 m!900701))

(declare-fun m!900703 () Bool)

(assert (=> b!972934 m!900703))

(declare-fun m!900705 () Bool)

(assert (=> b!972925 m!900705))

(declare-fun m!900707 () Bool)

(assert (=> b!972925 m!900707))

(declare-fun m!900709 () Bool)

(assert (=> b!972925 m!900709))

(assert (=> b!972925 m!900705))

(assert (=> b!972925 m!900709))

(declare-fun m!900711 () Bool)

(assert (=> b!972925 m!900711))

(assert (=> b!972925 m!900707))

(declare-fun m!900713 () Bool)

(assert (=> b!972925 m!900713))

(declare-fun m!900715 () Bool)

(assert (=> b!972925 m!900715))

(assert (=> b!972927 m!900697))

(assert (=> b!972927 m!900697))

(declare-fun m!900717 () Bool)

(assert (=> b!972927 m!900717))

(declare-fun m!900719 () Bool)

(assert (=> b!972933 m!900719))

(declare-fun m!900721 () Bool)

(assert (=> b!972933 m!900721))

(declare-fun m!900723 () Bool)

(assert (=> b!972933 m!900723))

(declare-fun m!900725 () Bool)

(assert (=> mapNonEmpty!35275 m!900725))

(check-sat (not b!972933) (not b!972928) b_and!30791 (not b!972927) (not b!972932) (not b!972934) tp_is_empty!22177 (not b_lambda!14457) (not start!83454) (not mapNonEmpty!35275) (not b!972925) (not b_next!19279))
(check-sat b_and!30791 (not b_next!19279))
