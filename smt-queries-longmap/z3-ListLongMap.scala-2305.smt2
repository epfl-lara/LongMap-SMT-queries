; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37294 () Bool)

(assert start!37294)

(declare-fun b_free!8421 () Bool)

(declare-fun b_next!8421 () Bool)

(assert (=> start!37294 (= b_free!8421 (not b_next!8421))))

(declare-fun tp!29978 () Bool)

(declare-fun b_and!15663 () Bool)

(assert (=> start!37294 (= tp!29978 b_and!15663)))

(declare-fun b!377916 () Bool)

(declare-fun res!213933 () Bool)

(declare-fun e!230047 () Bool)

(assert (=> b!377916 (=> (not res!213933) (not e!230047))))

(declare-datatypes ((array!22065 0))(
  ( (array!22066 (arr!10501 (Array (_ BitVec 32) (_ BitVec 64))) (size!10853 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22065)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377916 (= res!213933 (or (= (select (arr!10501 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10501 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377917 () Bool)

(declare-fun res!213936 () Bool)

(assert (=> b!377917 (=> (not res!213936) (not e!230047))))

(assert (=> b!377917 (= res!213936 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10853 _keys!658))))))

(declare-fun b!377918 () Bool)

(declare-fun res!213929 () Bool)

(assert (=> b!377918 (=> (not res!213929) (not e!230047))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377918 (= res!213929 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377920 () Bool)

(declare-fun res!213930 () Bool)

(assert (=> b!377920 (=> (not res!213930) (not e!230047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377920 (= res!213930 (validKeyInArray!0 k0!778))))

(declare-fun b!377921 () Bool)

(declare-fun e!230050 () Bool)

(declare-fun tp_is_empty!9069 () Bool)

(assert (=> b!377921 (= e!230050 tp_is_empty!9069)))

(declare-fun b!377922 () Bool)

(declare-fun e!230048 () Bool)

(assert (=> b!377922 (= e!230048 tp_is_empty!9069)))

(declare-fun b!377923 () Bool)

(declare-fun e!230053 () Bool)

(declare-fun mapRes!15168 () Bool)

(assert (=> b!377923 (= e!230053 (and e!230048 mapRes!15168))))

(declare-fun condMapEmpty!15168 () Bool)

(declare-datatypes ((V!13197 0))(
  ( (V!13198 (val!4579 Int)) )
))
(declare-datatypes ((ValueCell!4191 0))(
  ( (ValueCellFull!4191 (v!6776 V!13197)) (EmptyCell!4191) )
))
(declare-datatypes ((array!22067 0))(
  ( (array!22068 (arr!10502 (Array (_ BitVec 32) ValueCell!4191)) (size!10854 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22067)

(declare-fun mapDefault!15168 () ValueCell!4191)

(assert (=> b!377923 (= condMapEmpty!15168 (= (arr!10502 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4191)) mapDefault!15168)))))

(declare-fun b!377924 () Bool)

(declare-fun e!230049 () Bool)

(assert (=> b!377924 (= e!230049 true)))

(declare-datatypes ((tuple2!6110 0))(
  ( (tuple2!6111 (_1!3066 (_ BitVec 64)) (_2!3066 V!13197)) )
))
(declare-datatypes ((List!5948 0))(
  ( (Nil!5945) (Cons!5944 (h!6800 tuple2!6110) (t!11098 List!5948)) )
))
(declare-datatypes ((ListLongMap!5023 0))(
  ( (ListLongMap!5024 (toList!2527 List!5948)) )
))
(declare-fun lt!175910 () ListLongMap!5023)

(declare-fun lt!175909 () ListLongMap!5023)

(declare-fun lt!175920 () tuple2!6110)

(declare-fun +!873 (ListLongMap!5023 tuple2!6110) ListLongMap!5023)

(assert (=> b!377924 (= lt!175910 (+!873 lt!175909 lt!175920))))

(declare-fun v!373 () V!13197)

(declare-datatypes ((Unit!11646 0))(
  ( (Unit!11647) )
))
(declare-fun lt!175908 () Unit!11646)

(declare-fun lt!175919 () ListLongMap!5023)

(declare-fun zeroValue!472 () V!13197)

(declare-fun addCommutativeForDiffKeys!280 (ListLongMap!5023 (_ BitVec 64) V!13197 (_ BitVec 64) V!13197) Unit!11646)

(assert (=> b!377924 (= lt!175908 (addCommutativeForDiffKeys!280 lt!175919 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377925 () Bool)

(declare-fun res!213931 () Bool)

(assert (=> b!377925 (=> (not res!213931) (not e!230047))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22065 (_ BitVec 32)) Bool)

(assert (=> b!377925 (= res!213931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377926 () Bool)

(declare-fun e!230051 () Bool)

(declare-fun e!230054 () Bool)

(assert (=> b!377926 (= e!230051 (not e!230054))))

(declare-fun res!213935 () Bool)

(assert (=> b!377926 (=> res!213935 e!230054)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377926 (= res!213935 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!175913 () ListLongMap!5023)

(declare-fun minValue!472 () V!13197)

(declare-fun getCurrentListMap!1954 (array!22065 array!22067 (_ BitVec 32) (_ BitVec 32) V!13197 V!13197 (_ BitVec 32) Int) ListLongMap!5023)

(assert (=> b!377926 (= lt!175913 (getCurrentListMap!1954 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175918 () array!22065)

(declare-fun lt!175912 () array!22067)

(declare-fun lt!175911 () ListLongMap!5023)

(assert (=> b!377926 (= lt!175911 (getCurrentListMap!1954 lt!175918 lt!175912 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175917 () ListLongMap!5023)

(declare-fun lt!175914 () ListLongMap!5023)

(assert (=> b!377926 (and (= lt!175917 lt!175914) (= lt!175914 lt!175917))))

(assert (=> b!377926 (= lt!175914 (+!873 lt!175919 lt!175920))))

(assert (=> b!377926 (= lt!175920 (tuple2!6111 k0!778 v!373))))

(declare-fun lt!175916 () Unit!11646)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!112 (array!22065 array!22067 (_ BitVec 32) (_ BitVec 32) V!13197 V!13197 (_ BitVec 32) (_ BitVec 64) V!13197 (_ BitVec 32) Int) Unit!11646)

(assert (=> b!377926 (= lt!175916 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!112 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!788 (array!22065 array!22067 (_ BitVec 32) (_ BitVec 32) V!13197 V!13197 (_ BitVec 32) Int) ListLongMap!5023)

(assert (=> b!377926 (= lt!175917 (getCurrentListMapNoExtraKeys!788 lt!175918 lt!175912 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377926 (= lt!175912 (array!22068 (store (arr!10502 _values!506) i!548 (ValueCellFull!4191 v!373)) (size!10854 _values!506)))))

(assert (=> b!377926 (= lt!175919 (getCurrentListMapNoExtraKeys!788 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377927 () Bool)

(assert (=> b!377927 (= e!230054 e!230049)))

(declare-fun res!213927 () Bool)

(assert (=> b!377927 (=> res!213927 e!230049)))

(assert (=> b!377927 (= res!213927 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!377927 (= lt!175911 lt!175910)))

(declare-fun lt!175915 () tuple2!6110)

(assert (=> b!377927 (= lt!175910 (+!873 lt!175914 lt!175915))))

(assert (=> b!377927 (= lt!175913 lt!175909)))

(assert (=> b!377927 (= lt!175909 (+!873 lt!175919 lt!175915))))

(assert (=> b!377927 (= lt!175911 (+!873 lt!175917 lt!175915))))

(assert (=> b!377927 (= lt!175915 (tuple2!6111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377928 () Bool)

(declare-fun res!213934 () Bool)

(assert (=> b!377928 (=> (not res!213934) (not e!230051))))

(declare-datatypes ((List!5949 0))(
  ( (Nil!5946) (Cons!5945 (h!6801 (_ BitVec 64)) (t!11099 List!5949)) )
))
(declare-fun arrayNoDuplicates!0 (array!22065 (_ BitVec 32) List!5949) Bool)

(assert (=> b!377928 (= res!213934 (arrayNoDuplicates!0 lt!175918 #b00000000000000000000000000000000 Nil!5946))))

(declare-fun b!377929 () Bool)

(assert (=> b!377929 (= e!230047 e!230051)))

(declare-fun res!213932 () Bool)

(assert (=> b!377929 (=> (not res!213932) (not e!230051))))

(assert (=> b!377929 (= res!213932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175918 mask!970))))

(assert (=> b!377929 (= lt!175918 (array!22066 (store (arr!10501 _keys!658) i!548 k0!778) (size!10853 _keys!658)))))

(declare-fun mapIsEmpty!15168 () Bool)

(assert (=> mapIsEmpty!15168 mapRes!15168))

(declare-fun b!377930 () Bool)

(declare-fun res!213928 () Bool)

(assert (=> b!377930 (=> (not res!213928) (not e!230047))))

(assert (=> b!377930 (= res!213928 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5946))))

(declare-fun mapNonEmpty!15168 () Bool)

(declare-fun tp!29979 () Bool)

(assert (=> mapNonEmpty!15168 (= mapRes!15168 (and tp!29979 e!230050))))

(declare-fun mapValue!15168 () ValueCell!4191)

(declare-fun mapKey!15168 () (_ BitVec 32))

(declare-fun mapRest!15168 () (Array (_ BitVec 32) ValueCell!4191))

(assert (=> mapNonEmpty!15168 (= (arr!10502 _values!506) (store mapRest!15168 mapKey!15168 mapValue!15168))))

(declare-fun b!377919 () Bool)

(declare-fun res!213937 () Bool)

(assert (=> b!377919 (=> (not res!213937) (not e!230047))))

(assert (=> b!377919 (= res!213937 (and (= (size!10854 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10853 _keys!658) (size!10854 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!213938 () Bool)

(assert (=> start!37294 (=> (not res!213938) (not e!230047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37294 (= res!213938 (validMask!0 mask!970))))

(assert (=> start!37294 e!230047))

(declare-fun array_inv!7734 (array!22067) Bool)

(assert (=> start!37294 (and (array_inv!7734 _values!506) e!230053)))

(assert (=> start!37294 tp!29978))

(assert (=> start!37294 true))

(assert (=> start!37294 tp_is_empty!9069))

(declare-fun array_inv!7735 (array!22065) Bool)

(assert (=> start!37294 (array_inv!7735 _keys!658)))

(assert (= (and start!37294 res!213938) b!377919))

(assert (= (and b!377919 res!213937) b!377925))

(assert (= (and b!377925 res!213931) b!377930))

(assert (= (and b!377930 res!213928) b!377917))

(assert (= (and b!377917 res!213936) b!377920))

(assert (= (and b!377920 res!213930) b!377916))

(assert (= (and b!377916 res!213933) b!377918))

(assert (= (and b!377918 res!213929) b!377929))

(assert (= (and b!377929 res!213932) b!377928))

(assert (= (and b!377928 res!213934) b!377926))

(assert (= (and b!377926 (not res!213935)) b!377927))

(assert (= (and b!377927 (not res!213927)) b!377924))

(assert (= (and b!377923 condMapEmpty!15168) mapIsEmpty!15168))

(assert (= (and b!377923 (not condMapEmpty!15168)) mapNonEmpty!15168))

(get-info :version)

(assert (= (and mapNonEmpty!15168 ((_ is ValueCellFull!4191) mapValue!15168)) b!377921))

(assert (= (and b!377923 ((_ is ValueCellFull!4191) mapDefault!15168)) b!377922))

(assert (= start!37294 b!377923))

(declare-fun m!374715 () Bool)

(assert (=> b!377926 m!374715))

(declare-fun m!374717 () Bool)

(assert (=> b!377926 m!374717))

(declare-fun m!374719 () Bool)

(assert (=> b!377926 m!374719))

(declare-fun m!374721 () Bool)

(assert (=> b!377926 m!374721))

(declare-fun m!374723 () Bool)

(assert (=> b!377926 m!374723))

(declare-fun m!374725 () Bool)

(assert (=> b!377926 m!374725))

(declare-fun m!374727 () Bool)

(assert (=> b!377926 m!374727))

(declare-fun m!374729 () Bool)

(assert (=> b!377925 m!374729))

(declare-fun m!374731 () Bool)

(assert (=> b!377920 m!374731))

(declare-fun m!374733 () Bool)

(assert (=> mapNonEmpty!15168 m!374733))

(declare-fun m!374735 () Bool)

(assert (=> b!377928 m!374735))

(declare-fun m!374737 () Bool)

(assert (=> b!377929 m!374737))

(declare-fun m!374739 () Bool)

(assert (=> b!377929 m!374739))

(declare-fun m!374741 () Bool)

(assert (=> start!37294 m!374741))

(declare-fun m!374743 () Bool)

(assert (=> start!37294 m!374743))

(declare-fun m!374745 () Bool)

(assert (=> start!37294 m!374745))

(declare-fun m!374747 () Bool)

(assert (=> b!377924 m!374747))

(declare-fun m!374749 () Bool)

(assert (=> b!377924 m!374749))

(declare-fun m!374751 () Bool)

(assert (=> b!377927 m!374751))

(declare-fun m!374753 () Bool)

(assert (=> b!377927 m!374753))

(declare-fun m!374755 () Bool)

(assert (=> b!377927 m!374755))

(declare-fun m!374757 () Bool)

(assert (=> b!377916 m!374757))

(declare-fun m!374759 () Bool)

(assert (=> b!377918 m!374759))

(declare-fun m!374761 () Bool)

(assert (=> b!377930 m!374761))

(check-sat (not b!377926) (not mapNonEmpty!15168) (not b!377929) (not b_next!8421) (not b!377925) (not b!377918) b_and!15663 (not b!377930) tp_is_empty!9069 (not start!37294) (not b!377924) (not b!377927) (not b!377920) (not b!377928))
(check-sat b_and!15663 (not b_next!8421))
