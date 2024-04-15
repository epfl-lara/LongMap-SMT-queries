; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37278 () Bool)

(assert start!37278)

(declare-fun b_free!8419 () Bool)

(declare-fun b_next!8419 () Bool)

(assert (=> start!37278 (= b_free!8419 (not b_next!8419))))

(declare-fun tp!29972 () Bool)

(declare-fun b_and!15635 () Bool)

(assert (=> start!37278 (= tp!29972 b_and!15635)))

(declare-fun b!377600 () Bool)

(declare-fun e!229854 () Bool)

(declare-fun e!229853 () Bool)

(assert (=> b!377600 (= e!229854 (not e!229853))))

(declare-fun res!213771 () Bool)

(assert (=> b!377600 (=> res!213771 e!229853)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377600 (= res!213771 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13195 0))(
  ( (V!13196 (val!4578 Int)) )
))
(declare-datatypes ((ValueCell!4190 0))(
  ( (ValueCellFull!4190 (v!6769 V!13195)) (EmptyCell!4190) )
))
(declare-datatypes ((array!22045 0))(
  ( (array!22046 (arr!10491 (Array (_ BitVec 32) ValueCell!4190)) (size!10844 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22045)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6090 0))(
  ( (tuple2!6091 (_1!3056 (_ BitVec 64)) (_2!3056 V!13195)) )
))
(declare-datatypes ((List!5919 0))(
  ( (Nil!5916) (Cons!5915 (h!6771 tuple2!6090) (t!11060 List!5919)) )
))
(declare-datatypes ((ListLongMap!4993 0))(
  ( (ListLongMap!4994 (toList!2512 List!5919)) )
))
(declare-fun lt!175635 () ListLongMap!4993)

(declare-datatypes ((array!22047 0))(
  ( (array!22048 (arr!10492 (Array (_ BitVec 32) (_ BitVec 64))) (size!10845 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22047)

(declare-fun zeroValue!472 () V!13195)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13195)

(declare-fun getCurrentListMap!1919 (array!22047 array!22045 (_ BitVec 32) (_ BitVec 32) V!13195 V!13195 (_ BitVec 32) Int) ListLongMap!4993)

(assert (=> b!377600 (= lt!175635 (getCurrentListMap!1919 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175642 () ListLongMap!4993)

(declare-fun lt!175646 () array!22047)

(declare-fun lt!175647 () array!22045)

(assert (=> b!377600 (= lt!175642 (getCurrentListMap!1919 lt!175646 lt!175647 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175644 () ListLongMap!4993)

(declare-fun lt!175643 () ListLongMap!4993)

(assert (=> b!377600 (and (= lt!175644 lt!175643) (= lt!175643 lt!175644))))

(declare-fun lt!175641 () ListLongMap!4993)

(declare-fun lt!175638 () tuple2!6090)

(declare-fun +!880 (ListLongMap!4993 tuple2!6090) ListLongMap!4993)

(assert (=> b!377600 (= lt!175643 (+!880 lt!175641 lt!175638))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13195)

(assert (=> b!377600 (= lt!175638 (tuple2!6091 k0!778 v!373))))

(declare-datatypes ((Unit!11628 0))(
  ( (Unit!11629) )
))
(declare-fun lt!175636 () Unit!11628)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!112 (array!22047 array!22045 (_ BitVec 32) (_ BitVec 32) V!13195 V!13195 (_ BitVec 32) (_ BitVec 64) V!13195 (_ BitVec 32) Int) Unit!11628)

(assert (=> b!377600 (= lt!175636 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!112 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!784 (array!22047 array!22045 (_ BitVec 32) (_ BitVec 32) V!13195 V!13195 (_ BitVec 32) Int) ListLongMap!4993)

(assert (=> b!377600 (= lt!175644 (getCurrentListMapNoExtraKeys!784 lt!175646 lt!175647 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377600 (= lt!175647 (array!22046 (store (arr!10491 _values!506) i!548 (ValueCellFull!4190 v!373)) (size!10844 _values!506)))))

(assert (=> b!377600 (= lt!175641 (getCurrentListMapNoExtraKeys!784 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377601 () Bool)

(declare-fun e!229855 () Bool)

(declare-fun tp_is_empty!9067 () Bool)

(assert (=> b!377601 (= e!229855 tp_is_empty!9067)))

(declare-fun mapNonEmpty!15165 () Bool)

(declare-fun mapRes!15165 () Bool)

(declare-fun tp!29973 () Bool)

(declare-fun e!229852 () Bool)

(assert (=> mapNonEmpty!15165 (= mapRes!15165 (and tp!29973 e!229852))))

(declare-fun mapKey!15165 () (_ BitVec 32))

(declare-fun mapRest!15165 () (Array (_ BitVec 32) ValueCell!4190))

(declare-fun mapValue!15165 () ValueCell!4190)

(assert (=> mapNonEmpty!15165 (= (arr!10491 _values!506) (store mapRest!15165 mapKey!15165 mapValue!15165))))

(declare-fun b!377602 () Bool)

(declare-fun res!213773 () Bool)

(declare-fun e!229850 () Bool)

(assert (=> b!377602 (=> (not res!213773) (not e!229850))))

(declare-datatypes ((List!5920 0))(
  ( (Nil!5917) (Cons!5916 (h!6772 (_ BitVec 64)) (t!11061 List!5920)) )
))
(declare-fun arrayNoDuplicates!0 (array!22047 (_ BitVec 32) List!5920) Bool)

(assert (=> b!377602 (= res!213773 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5917))))

(declare-fun b!377603 () Bool)

(assert (=> b!377603 (= e!229852 tp_is_empty!9067)))

(declare-fun b!377604 () Bool)

(declare-fun e!229851 () Bool)

(assert (=> b!377604 (= e!229851 true)))

(declare-fun lt!175640 () ListLongMap!4993)

(declare-fun lt!175637 () ListLongMap!4993)

(assert (=> b!377604 (= lt!175640 (+!880 lt!175637 lt!175638))))

(declare-fun lt!175645 () Unit!11628)

(declare-fun addCommutativeForDiffKeys!285 (ListLongMap!4993 (_ BitVec 64) V!13195 (_ BitVec 64) V!13195) Unit!11628)

(assert (=> b!377604 (= lt!175645 (addCommutativeForDiffKeys!285 lt!175641 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377605 () Bool)

(declare-fun res!213766 () Bool)

(assert (=> b!377605 (=> (not res!213766) (not e!229850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22047 (_ BitVec 32)) Bool)

(assert (=> b!377605 (= res!213766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!377606 () Bool)

(declare-fun res!213765 () Bool)

(assert (=> b!377606 (=> (not res!213765) (not e!229850))))

(assert (=> b!377606 (= res!213765 (and (= (size!10844 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10845 _keys!658) (size!10844 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377607 () Bool)

(declare-fun res!213772 () Bool)

(assert (=> b!377607 (=> (not res!213772) (not e!229854))))

(assert (=> b!377607 (= res!213772 (arrayNoDuplicates!0 lt!175646 #b00000000000000000000000000000000 Nil!5917))))

(declare-fun b!377608 () Bool)

(assert (=> b!377608 (= e!229850 e!229854)))

(declare-fun res!213764 () Bool)

(assert (=> b!377608 (=> (not res!213764) (not e!229854))))

(assert (=> b!377608 (= res!213764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175646 mask!970))))

(assert (=> b!377608 (= lt!175646 (array!22048 (store (arr!10492 _keys!658) i!548 k0!778) (size!10845 _keys!658)))))

(declare-fun b!377609 () Bool)

(declare-fun e!229849 () Bool)

(assert (=> b!377609 (= e!229849 (and e!229855 mapRes!15165))))

(declare-fun condMapEmpty!15165 () Bool)

(declare-fun mapDefault!15165 () ValueCell!4190)

(assert (=> b!377609 (= condMapEmpty!15165 (= (arr!10491 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4190)) mapDefault!15165)))))

(declare-fun res!213768 () Bool)

(assert (=> start!37278 (=> (not res!213768) (not e!229850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37278 (= res!213768 (validMask!0 mask!970))))

(assert (=> start!37278 e!229850))

(declare-fun array_inv!7732 (array!22045) Bool)

(assert (=> start!37278 (and (array_inv!7732 _values!506) e!229849)))

(assert (=> start!37278 tp!29972))

(assert (=> start!37278 true))

(assert (=> start!37278 tp_is_empty!9067))

(declare-fun array_inv!7733 (array!22047) Bool)

(assert (=> start!37278 (array_inv!7733 _keys!658)))

(declare-fun b!377610 () Bool)

(assert (=> b!377610 (= e!229853 e!229851)))

(declare-fun res!213763 () Bool)

(assert (=> b!377610 (=> res!213763 e!229851)))

(assert (=> b!377610 (= res!213763 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!377610 (= lt!175642 lt!175640)))

(declare-fun lt!175639 () tuple2!6090)

(assert (=> b!377610 (= lt!175640 (+!880 lt!175643 lt!175639))))

(assert (=> b!377610 (= lt!175635 lt!175637)))

(assert (=> b!377610 (= lt!175637 (+!880 lt!175641 lt!175639))))

(assert (=> b!377610 (= lt!175642 (+!880 lt!175644 lt!175639))))

(assert (=> b!377610 (= lt!175639 (tuple2!6091 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapIsEmpty!15165 () Bool)

(assert (=> mapIsEmpty!15165 mapRes!15165))

(declare-fun b!377611 () Bool)

(declare-fun res!213769 () Bool)

(assert (=> b!377611 (=> (not res!213769) (not e!229850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377611 (= res!213769 (validKeyInArray!0 k0!778))))

(declare-fun b!377612 () Bool)

(declare-fun res!213762 () Bool)

(assert (=> b!377612 (=> (not res!213762) (not e!229850))))

(assert (=> b!377612 (= res!213762 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10845 _keys!658))))))

(declare-fun b!377613 () Bool)

(declare-fun res!213770 () Bool)

(assert (=> b!377613 (=> (not res!213770) (not e!229850))))

(declare-fun arrayContainsKey!0 (array!22047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377613 (= res!213770 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377614 () Bool)

(declare-fun res!213767 () Bool)

(assert (=> b!377614 (=> (not res!213767) (not e!229850))))

(assert (=> b!377614 (= res!213767 (or (= (select (arr!10492 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10492 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37278 res!213768) b!377606))

(assert (= (and b!377606 res!213765) b!377605))

(assert (= (and b!377605 res!213766) b!377602))

(assert (= (and b!377602 res!213773) b!377612))

(assert (= (and b!377612 res!213762) b!377611))

(assert (= (and b!377611 res!213769) b!377614))

(assert (= (and b!377614 res!213767) b!377613))

(assert (= (and b!377613 res!213770) b!377608))

(assert (= (and b!377608 res!213764) b!377607))

(assert (= (and b!377607 res!213772) b!377600))

(assert (= (and b!377600 (not res!213771)) b!377610))

(assert (= (and b!377610 (not res!213763)) b!377604))

(assert (= (and b!377609 condMapEmpty!15165) mapIsEmpty!15165))

(assert (= (and b!377609 (not condMapEmpty!15165)) mapNonEmpty!15165))

(get-info :version)

(assert (= (and mapNonEmpty!15165 ((_ is ValueCellFull!4190) mapValue!15165)) b!377603))

(assert (= (and b!377609 ((_ is ValueCellFull!4190) mapDefault!15165)) b!377601))

(assert (= start!37278 b!377609))

(declare-fun m!373943 () Bool)

(assert (=> start!37278 m!373943))

(declare-fun m!373945 () Bool)

(assert (=> start!37278 m!373945))

(declare-fun m!373947 () Bool)

(assert (=> start!37278 m!373947))

(declare-fun m!373949 () Bool)

(assert (=> b!377604 m!373949))

(declare-fun m!373951 () Bool)

(assert (=> b!377604 m!373951))

(declare-fun m!373953 () Bool)

(assert (=> b!377607 m!373953))

(declare-fun m!373955 () Bool)

(assert (=> b!377611 m!373955))

(declare-fun m!373957 () Bool)

(assert (=> b!377600 m!373957))

(declare-fun m!373959 () Bool)

(assert (=> b!377600 m!373959))

(declare-fun m!373961 () Bool)

(assert (=> b!377600 m!373961))

(declare-fun m!373963 () Bool)

(assert (=> b!377600 m!373963))

(declare-fun m!373965 () Bool)

(assert (=> b!377600 m!373965))

(declare-fun m!373967 () Bool)

(assert (=> b!377600 m!373967))

(declare-fun m!373969 () Bool)

(assert (=> b!377600 m!373969))

(declare-fun m!373971 () Bool)

(assert (=> b!377605 m!373971))

(declare-fun m!373973 () Bool)

(assert (=> b!377613 m!373973))

(declare-fun m!373975 () Bool)

(assert (=> b!377610 m!373975))

(declare-fun m!373977 () Bool)

(assert (=> b!377610 m!373977))

(declare-fun m!373979 () Bool)

(assert (=> b!377610 m!373979))

(declare-fun m!373981 () Bool)

(assert (=> b!377602 m!373981))

(declare-fun m!373983 () Bool)

(assert (=> b!377614 m!373983))

(declare-fun m!373985 () Bool)

(assert (=> mapNonEmpty!15165 m!373985))

(declare-fun m!373987 () Bool)

(assert (=> b!377608 m!373987))

(declare-fun m!373989 () Bool)

(assert (=> b!377608 m!373989))

(check-sat (not b!377611) (not b_next!8419) (not b!377602) b_and!15635 (not b!377608) tp_is_empty!9067 (not b!377604) (not b!377613) (not b!377605) (not mapNonEmpty!15165) (not b!377607) (not b!377610) (not start!37278) (not b!377600))
(check-sat b_and!15635 (not b_next!8419))
