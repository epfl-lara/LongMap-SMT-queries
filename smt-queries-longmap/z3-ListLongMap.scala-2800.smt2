; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40690 () Bool)

(assert start!40690)

(declare-fun b_free!10701 () Bool)

(declare-fun b_next!10701 () Bool)

(assert (=> start!40690 (= b_free!10701 (not b_next!10701))))

(declare-fun tp!37923 () Bool)

(declare-fun b_and!18709 () Bool)

(assert (=> start!40690 (= tp!37923 b_and!18709)))

(declare-fun b!449957 () Bool)

(declare-fun e!263744 () Bool)

(declare-fun e!263743 () Bool)

(assert (=> b!449957 (= e!263744 e!263743)))

(declare-fun res!267741 () Bool)

(assert (=> b!449957 (=> (not res!267741) (not e!263743))))

(declare-datatypes ((array!27885 0))(
  ( (array!27886 (arr!13388 (Array (_ BitVec 32) (_ BitVec 64))) (size!13740 (_ BitVec 32))) )
))
(declare-fun lt!204479 () array!27885)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27885 (_ BitVec 32)) Bool)

(assert (=> b!449957 (= res!267741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204479 mask!1025))))

(declare-fun _keys!709 () array!27885)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449957 (= lt!204479 (array!27886 (store (arr!13388 _keys!709) i!563 k0!794) (size!13740 _keys!709)))))

(declare-datatypes ((V!17157 0))(
  ( (V!17158 (val!6064 Int)) )
))
(declare-fun minValue!515 () V!17157)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5676 0))(
  ( (ValueCellFull!5676 (v!8319 V!17157)) (EmptyCell!5676) )
))
(declare-datatypes ((array!27887 0))(
  ( (array!27888 (arr!13389 (Array (_ BitVec 32) ValueCell!5676)) (size!13741 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27887)

(declare-fun c!55958 () Bool)

(declare-fun lt!204477 () array!27887)

(declare-datatypes ((tuple2!7960 0))(
  ( (tuple2!7961 (_1!3991 (_ BitVec 64)) (_2!3991 V!17157)) )
))
(declare-datatypes ((List!8029 0))(
  ( (Nil!8026) (Cons!8025 (h!8881 tuple2!7960) (t!13791 List!8029)) )
))
(declare-datatypes ((ListLongMap!6873 0))(
  ( (ListLongMap!6874 (toList!3452 List!8029)) )
))
(declare-fun call!29695 () ListLongMap!6873)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17157)

(declare-fun bm!29692 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1638 (array!27885 array!27887 (_ BitVec 32) (_ BitVec 32) V!17157 V!17157 (_ BitVec 32) Int) ListLongMap!6873)

(assert (=> bm!29692 (= call!29695 (getCurrentListMapNoExtraKeys!1638 (ite c!55958 _keys!709 lt!204479) (ite c!55958 _values!549 lt!204477) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29696 () ListLongMap!6873)

(declare-fun b!449958 () Bool)

(declare-fun e!263739 () Bool)

(declare-fun v!412 () V!17157)

(declare-fun +!1537 (ListLongMap!6873 tuple2!7960) ListLongMap!6873)

(assert (=> b!449958 (= e!263739 (= call!29696 (+!1537 call!29695 (tuple2!7961 k0!794 v!412))))))

(declare-fun b!449959 () Bool)

(declare-fun res!267749 () Bool)

(assert (=> b!449959 (=> (not res!267749) (not e!263744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449959 (= res!267749 (validKeyInArray!0 k0!794))))

(declare-fun b!449960 () Bool)

(declare-fun res!267745 () Bool)

(assert (=> b!449960 (=> (not res!267745) (not e!263744))))

(assert (=> b!449960 (= res!267745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449962 () Bool)

(declare-fun e!263737 () Bool)

(declare-fun tp_is_empty!12039 () Bool)

(assert (=> b!449962 (= e!263737 tp_is_empty!12039)))

(declare-fun b!449963 () Bool)

(declare-fun res!267748 () Bool)

(assert (=> b!449963 (=> (not res!267748) (not e!263744))))

(declare-datatypes ((List!8030 0))(
  ( (Nil!8027) (Cons!8026 (h!8882 (_ BitVec 64)) (t!13792 List!8030)) )
))
(declare-fun arrayNoDuplicates!0 (array!27885 (_ BitVec 32) List!8030) Bool)

(assert (=> b!449963 (= res!267748 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8027))))

(declare-fun b!449964 () Bool)

(declare-fun e!263740 () Bool)

(assert (=> b!449964 (= e!263740 (not (bvslt from!863 (size!13740 _keys!709))))))

(assert (=> b!449964 e!263739))

(assert (=> b!449964 (= c!55958 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13184 0))(
  ( (Unit!13185) )
))
(declare-fun lt!204478 () Unit!13184)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!707 (array!27885 array!27887 (_ BitVec 32) (_ BitVec 32) V!17157 V!17157 (_ BitVec 32) (_ BitVec 64) V!17157 (_ BitVec 32) Int) Unit!13184)

(assert (=> b!449964 (= lt!204478 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!707 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!449965 () Bool)

(declare-fun res!267744 () Bool)

(assert (=> b!449965 (=> (not res!267744) (not e!263744))))

(assert (=> b!449965 (= res!267744 (and (= (size!13741 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13740 _keys!709) (size!13741 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449966 () Bool)

(assert (=> b!449966 (= e!263743 e!263740)))

(declare-fun res!267752 () Bool)

(assert (=> b!449966 (=> (not res!267752) (not e!263740))))

(assert (=> b!449966 (= res!267752 (= from!863 i!563))))

(declare-fun lt!204476 () ListLongMap!6873)

(assert (=> b!449966 (= lt!204476 (getCurrentListMapNoExtraKeys!1638 lt!204479 lt!204477 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!449966 (= lt!204477 (array!27888 (store (arr!13389 _values!549) i!563 (ValueCellFull!5676 v!412)) (size!13741 _values!549)))))

(declare-fun lt!204480 () ListLongMap!6873)

(assert (=> b!449966 (= lt!204480 (getCurrentListMapNoExtraKeys!1638 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449967 () Bool)

(declare-fun res!267742 () Bool)

(assert (=> b!449967 (=> (not res!267742) (not e!263744))))

(declare-fun arrayContainsKey!0 (array!27885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449967 (= res!267742 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19692 () Bool)

(declare-fun mapRes!19692 () Bool)

(assert (=> mapIsEmpty!19692 mapRes!19692))

(declare-fun b!449968 () Bool)

(declare-fun res!267743 () Bool)

(assert (=> b!449968 (=> (not res!267743) (not e!263744))))

(assert (=> b!449968 (= res!267743 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13740 _keys!709))))))

(declare-fun b!449969 () Bool)

(declare-fun res!267746 () Bool)

(assert (=> b!449969 (=> (not res!267746) (not e!263744))))

(assert (=> b!449969 (= res!267746 (or (= (select (arr!13388 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13388 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!29693 () Bool)

(assert (=> bm!29693 (= call!29696 (getCurrentListMapNoExtraKeys!1638 (ite c!55958 lt!204479 _keys!709) (ite c!55958 lt!204477 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!267747 () Bool)

(assert (=> start!40690 (=> (not res!267747) (not e!263744))))

(assert (=> start!40690 (= res!267747 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13740 _keys!709))))))

(assert (=> start!40690 e!263744))

(assert (=> start!40690 tp_is_empty!12039))

(assert (=> start!40690 tp!37923))

(assert (=> start!40690 true))

(declare-fun e!263738 () Bool)

(declare-fun array_inv!9698 (array!27887) Bool)

(assert (=> start!40690 (and (array_inv!9698 _values!549) e!263738)))

(declare-fun array_inv!9699 (array!27885) Bool)

(assert (=> start!40690 (array_inv!9699 _keys!709)))

(declare-fun b!449961 () Bool)

(declare-fun res!267751 () Bool)

(assert (=> b!449961 (=> (not res!267751) (not e!263743))))

(assert (=> b!449961 (= res!267751 (arrayNoDuplicates!0 lt!204479 #b00000000000000000000000000000000 Nil!8027))))

(declare-fun b!449970 () Bool)

(assert (=> b!449970 (= e!263739 (= call!29695 call!29696))))

(declare-fun b!449971 () Bool)

(declare-fun e!263741 () Bool)

(assert (=> b!449971 (= e!263741 tp_is_empty!12039)))

(declare-fun mapNonEmpty!19692 () Bool)

(declare-fun tp!37922 () Bool)

(assert (=> mapNonEmpty!19692 (= mapRes!19692 (and tp!37922 e!263737))))

(declare-fun mapValue!19692 () ValueCell!5676)

(declare-fun mapRest!19692 () (Array (_ BitVec 32) ValueCell!5676))

(declare-fun mapKey!19692 () (_ BitVec 32))

(assert (=> mapNonEmpty!19692 (= (arr!13389 _values!549) (store mapRest!19692 mapKey!19692 mapValue!19692))))

(declare-fun b!449972 () Bool)

(declare-fun res!267750 () Bool)

(assert (=> b!449972 (=> (not res!267750) (not e!263743))))

(assert (=> b!449972 (= res!267750 (bvsle from!863 i!563))))

(declare-fun b!449973 () Bool)

(declare-fun res!267753 () Bool)

(assert (=> b!449973 (=> (not res!267753) (not e!263744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449973 (= res!267753 (validMask!0 mask!1025))))

(declare-fun b!449974 () Bool)

(assert (=> b!449974 (= e!263738 (and e!263741 mapRes!19692))))

(declare-fun condMapEmpty!19692 () Bool)

(declare-fun mapDefault!19692 () ValueCell!5676)

(assert (=> b!449974 (= condMapEmpty!19692 (= (arr!13389 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5676)) mapDefault!19692)))))

(assert (= (and start!40690 res!267747) b!449973))

(assert (= (and b!449973 res!267753) b!449965))

(assert (= (and b!449965 res!267744) b!449960))

(assert (= (and b!449960 res!267745) b!449963))

(assert (= (and b!449963 res!267748) b!449968))

(assert (= (and b!449968 res!267743) b!449959))

(assert (= (and b!449959 res!267749) b!449969))

(assert (= (and b!449969 res!267746) b!449967))

(assert (= (and b!449967 res!267742) b!449957))

(assert (= (and b!449957 res!267741) b!449961))

(assert (= (and b!449961 res!267751) b!449972))

(assert (= (and b!449972 res!267750) b!449966))

(assert (= (and b!449966 res!267752) b!449964))

(assert (= (and b!449964 c!55958) b!449958))

(assert (= (and b!449964 (not c!55958)) b!449970))

(assert (= (or b!449958 b!449970) bm!29693))

(assert (= (or b!449958 b!449970) bm!29692))

(assert (= (and b!449974 condMapEmpty!19692) mapIsEmpty!19692))

(assert (= (and b!449974 (not condMapEmpty!19692)) mapNonEmpty!19692))

(get-info :version)

(assert (= (and mapNonEmpty!19692 ((_ is ValueCellFull!5676) mapValue!19692)) b!449962))

(assert (= (and b!449974 ((_ is ValueCellFull!5676) mapDefault!19692)) b!449971))

(assert (= start!40690 b!449974))

(declare-fun m!434001 () Bool)

(assert (=> bm!29693 m!434001))

(declare-fun m!434003 () Bool)

(assert (=> b!449964 m!434003))

(declare-fun m!434005 () Bool)

(assert (=> b!449967 m!434005))

(declare-fun m!434007 () Bool)

(assert (=> b!449973 m!434007))

(declare-fun m!434009 () Bool)

(assert (=> b!449960 m!434009))

(declare-fun m!434011 () Bool)

(assert (=> start!40690 m!434011))

(declare-fun m!434013 () Bool)

(assert (=> start!40690 m!434013))

(declare-fun m!434015 () Bool)

(assert (=> b!449961 m!434015))

(declare-fun m!434017 () Bool)

(assert (=> b!449957 m!434017))

(declare-fun m!434019 () Bool)

(assert (=> b!449957 m!434019))

(declare-fun m!434021 () Bool)

(assert (=> bm!29692 m!434021))

(declare-fun m!434023 () Bool)

(assert (=> b!449966 m!434023))

(declare-fun m!434025 () Bool)

(assert (=> b!449966 m!434025))

(declare-fun m!434027 () Bool)

(assert (=> b!449966 m!434027))

(declare-fun m!434029 () Bool)

(assert (=> b!449959 m!434029))

(declare-fun m!434031 () Bool)

(assert (=> b!449963 m!434031))

(declare-fun m!434033 () Bool)

(assert (=> b!449958 m!434033))

(declare-fun m!434035 () Bool)

(assert (=> b!449969 m!434035))

(declare-fun m!434037 () Bool)

(assert (=> mapNonEmpty!19692 m!434037))

(check-sat (not b!449958) (not b_next!10701) (not start!40690) (not b!449966) (not mapNonEmpty!19692) (not b!449960) (not bm!29693) tp_is_empty!12039 (not b!449963) (not b!449973) (not b!449967) b_and!18709 (not b!449957) (not b!449964) (not b!449959) (not bm!29692) (not b!449961))
(check-sat b_and!18709 (not b_next!10701))
