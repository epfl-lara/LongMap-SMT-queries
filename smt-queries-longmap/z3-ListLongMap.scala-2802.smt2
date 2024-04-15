; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40686 () Bool)

(assert start!40686)

(declare-fun b_free!10711 () Bool)

(declare-fun b_next!10711 () Bool)

(assert (=> start!40686 (= b_free!10711 (not b_next!10711))))

(declare-fun tp!37953 () Bool)

(declare-fun b_and!18693 () Bool)

(assert (=> start!40686 (= tp!37953 b_and!18693)))

(declare-fun b!449958 () Bool)

(declare-fun e!263688 () Bool)

(declare-datatypes ((V!17171 0))(
  ( (V!17172 (val!6069 Int)) )
))
(declare-datatypes ((tuple2!7982 0))(
  ( (tuple2!7983 (_1!4002 (_ BitVec 64)) (_2!4002 V!17171)) )
))
(declare-datatypes ((List!8047 0))(
  ( (Nil!8044) (Cons!8043 (h!8899 tuple2!7982) (t!13800 List!8047)) )
))
(declare-datatypes ((ListLongMap!6885 0))(
  ( (ListLongMap!6886 (toList!3458 List!8047)) )
))
(declare-fun call!29701 () ListLongMap!6885)

(declare-fun call!29700 () ListLongMap!6885)

(assert (=> b!449958 (= e!263688 (= call!29701 call!29700))))

(declare-fun mapIsEmpty!19707 () Bool)

(declare-fun mapRes!19707 () Bool)

(assert (=> mapIsEmpty!19707 mapRes!19707))

(declare-fun res!267813 () Bool)

(declare-fun e!263692 () Bool)

(assert (=> start!40686 (=> (not res!267813) (not e!263692))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27903 0))(
  ( (array!27904 (arr!13397 (Array (_ BitVec 32) (_ BitVec 64))) (size!13750 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27903)

(assert (=> start!40686 (= res!267813 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13750 _keys!709))))))

(assert (=> start!40686 e!263692))

(declare-fun tp_is_empty!12049 () Bool)

(assert (=> start!40686 tp_is_empty!12049))

(assert (=> start!40686 tp!37953))

(assert (=> start!40686 true))

(declare-datatypes ((ValueCell!5681 0))(
  ( (ValueCellFull!5681 (v!8318 V!17171)) (EmptyCell!5681) )
))
(declare-datatypes ((array!27905 0))(
  ( (array!27906 (arr!13398 (Array (_ BitVec 32) ValueCell!5681)) (size!13751 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27905)

(declare-fun e!263690 () Bool)

(declare-fun array_inv!9766 (array!27905) Bool)

(assert (=> start!40686 (and (array_inv!9766 _values!549) e!263690)))

(declare-fun array_inv!9767 (array!27903) Bool)

(assert (=> start!40686 (array_inv!9767 _keys!709)))

(declare-fun b!449959 () Bool)

(declare-fun res!267820 () Bool)

(assert (=> b!449959 (=> (not res!267820) (not e!263692))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449959 (= res!267820 (or (= (select (arr!13397 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13397 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17171)

(declare-fun b!449960 () Bool)

(declare-fun +!1565 (ListLongMap!6885 tuple2!7982) ListLongMap!6885)

(assert (=> b!449960 (= e!263688 (= call!29700 (+!1565 call!29701 (tuple2!7983 k0!794 v!412))))))

(declare-fun b!449961 () Bool)

(declare-fun e!263686 () Bool)

(assert (=> b!449961 (= e!263690 (and e!263686 mapRes!19707))))

(declare-fun condMapEmpty!19707 () Bool)

(declare-fun mapDefault!19707 () ValueCell!5681)

(assert (=> b!449961 (= condMapEmpty!19707 (= (arr!13398 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5681)) mapDefault!19707)))))

(declare-fun b!449962 () Bool)

(declare-fun res!267818 () Bool)

(declare-fun e!263691 () Bool)

(assert (=> b!449962 (=> (not res!267818) (not e!263691))))

(assert (=> b!449962 (= res!267818 (bvsle from!863 i!563))))

(declare-fun b!449963 () Bool)

(declare-fun res!267817 () Bool)

(assert (=> b!449963 (=> (not res!267817) (not e!263691))))

(declare-fun lt!204317 () array!27903)

(declare-datatypes ((List!8048 0))(
  ( (Nil!8045) (Cons!8044 (h!8900 (_ BitVec 64)) (t!13801 List!8048)) )
))
(declare-fun arrayNoDuplicates!0 (array!27903 (_ BitVec 32) List!8048) Bool)

(assert (=> b!449963 (= res!267817 (arrayNoDuplicates!0 lt!204317 #b00000000000000000000000000000000 Nil!8045))))

(declare-fun b!449964 () Bool)

(declare-fun res!267812 () Bool)

(assert (=> b!449964 (=> (not res!267812) (not e!263692))))

(assert (=> b!449964 (= res!267812 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8045))))

(declare-fun b!449965 () Bool)

(declare-fun res!267811 () Bool)

(assert (=> b!449965 (=> (not res!267811) (not e!263692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449965 (= res!267811 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19707 () Bool)

(declare-fun tp!37952 () Bool)

(declare-fun e!263687 () Bool)

(assert (=> mapNonEmpty!19707 (= mapRes!19707 (and tp!37952 e!263687))))

(declare-fun mapRest!19707 () (Array (_ BitVec 32) ValueCell!5681))

(declare-fun mapKey!19707 () (_ BitVec 32))

(declare-fun mapValue!19707 () ValueCell!5681)

(assert (=> mapNonEmpty!19707 (= (arr!13398 _values!549) (store mapRest!19707 mapKey!19707 mapValue!19707))))

(declare-fun b!449966 () Bool)

(declare-fun res!267815 () Bool)

(assert (=> b!449966 (=> (not res!267815) (not e!263692))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!449966 (= res!267815 (and (= (size!13751 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13750 _keys!709) (size!13751 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449967 () Bool)

(declare-fun res!267816 () Bool)

(assert (=> b!449967 (=> (not res!267816) (not e!263692))))

(declare-fun arrayContainsKey!0 (array!27903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449967 (= res!267816 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!449968 () Bool)

(declare-fun res!267809 () Bool)

(assert (=> b!449968 (=> (not res!267809) (not e!263692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27903 (_ BitVec 32)) Bool)

(assert (=> b!449968 (= res!267809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449969 () Bool)

(declare-fun e!263685 () Bool)

(assert (=> b!449969 (= e!263685 (bvslt i!563 (size!13751 _values!549)))))

(declare-fun b!449970 () Bool)

(assert (=> b!449970 (= e!263692 e!263691)))

(declare-fun res!267821 () Bool)

(assert (=> b!449970 (=> (not res!267821) (not e!263691))))

(assert (=> b!449970 (= res!267821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204317 mask!1025))))

(assert (=> b!449970 (= lt!204317 (array!27904 (store (arr!13397 _keys!709) i!563 k0!794) (size!13750 _keys!709)))))

(declare-fun b!449971 () Bool)

(declare-fun e!263693 () Bool)

(assert (=> b!449971 (= e!263691 e!263693)))

(declare-fun res!267814 () Bool)

(assert (=> b!449971 (=> (not res!267814) (not e!263693))))

(assert (=> b!449971 (= res!267814 (= from!863 i!563))))

(declare-fun minValue!515 () V!17171)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!204320 () ListLongMap!6885)

(declare-fun zeroValue!515 () V!17171)

(declare-fun lt!204319 () array!27905)

(declare-fun getCurrentListMapNoExtraKeys!1656 (array!27903 array!27905 (_ BitVec 32) (_ BitVec 32) V!17171 V!17171 (_ BitVec 32) Int) ListLongMap!6885)

(assert (=> b!449971 (= lt!204320 (getCurrentListMapNoExtraKeys!1656 lt!204317 lt!204319 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!449971 (= lt!204319 (array!27906 (store (arr!13398 _values!549) i!563 (ValueCellFull!5681 v!412)) (size!13751 _values!549)))))

(declare-fun lt!204321 () ListLongMap!6885)

(assert (=> b!449971 (= lt!204321 (getCurrentListMapNoExtraKeys!1656 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449972 () Bool)

(assert (=> b!449972 (= e!263687 tp_is_empty!12049)))

(declare-fun c!55902 () Bool)

(declare-fun bm!29697 () Bool)

(assert (=> bm!29697 (= call!29701 (getCurrentListMapNoExtraKeys!1656 (ite c!55902 _keys!709 lt!204317) (ite c!55902 _values!549 lt!204319) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!449973 () Bool)

(assert (=> b!449973 (= e!263686 tp_is_empty!12049)))

(declare-fun bm!29698 () Bool)

(assert (=> bm!29698 (= call!29700 (getCurrentListMapNoExtraKeys!1656 (ite c!55902 lt!204317 _keys!709) (ite c!55902 lt!204319 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!449974 () Bool)

(declare-fun res!267822 () Bool)

(assert (=> b!449974 (=> (not res!267822) (not e!263692))))

(assert (=> b!449974 (= res!267822 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13750 _keys!709))))))

(declare-fun b!449975 () Bool)

(declare-fun res!267810 () Bool)

(assert (=> b!449975 (=> (not res!267810) (not e!263692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449975 (= res!267810 (validMask!0 mask!1025))))

(declare-fun b!449976 () Bool)

(assert (=> b!449976 (= e!263693 (not e!263685))))

(declare-fun res!267819 () Bool)

(assert (=> b!449976 (=> res!267819 e!263685)))

(assert (=> b!449976 (= res!267819 (validKeyInArray!0 (select (arr!13397 _keys!709) from!863)))))

(assert (=> b!449976 e!263688))

(assert (=> b!449976 (= c!55902 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13147 0))(
  ( (Unit!13148) )
))
(declare-fun lt!204318 () Unit!13147)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!701 (array!27903 array!27905 (_ BitVec 32) (_ BitVec 32) V!17171 V!17171 (_ BitVec 32) (_ BitVec 64) V!17171 (_ BitVec 32) Int) Unit!13147)

(assert (=> b!449976 (= lt!204318 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!701 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40686 res!267813) b!449975))

(assert (= (and b!449975 res!267810) b!449966))

(assert (= (and b!449966 res!267815) b!449968))

(assert (= (and b!449968 res!267809) b!449964))

(assert (= (and b!449964 res!267812) b!449974))

(assert (= (and b!449974 res!267822) b!449965))

(assert (= (and b!449965 res!267811) b!449959))

(assert (= (and b!449959 res!267820) b!449967))

(assert (= (and b!449967 res!267816) b!449970))

(assert (= (and b!449970 res!267821) b!449963))

(assert (= (and b!449963 res!267817) b!449962))

(assert (= (and b!449962 res!267818) b!449971))

(assert (= (and b!449971 res!267814) b!449976))

(assert (= (and b!449976 c!55902) b!449960))

(assert (= (and b!449976 (not c!55902)) b!449958))

(assert (= (or b!449960 b!449958) bm!29698))

(assert (= (or b!449960 b!449958) bm!29697))

(assert (= (and b!449976 (not res!267819)) b!449969))

(assert (= (and b!449961 condMapEmpty!19707) mapIsEmpty!19707))

(assert (= (and b!449961 (not condMapEmpty!19707)) mapNonEmpty!19707))

(get-info :version)

(assert (= (and mapNonEmpty!19707 ((_ is ValueCellFull!5681) mapValue!19707)) b!449972))

(assert (= (and b!449961 ((_ is ValueCellFull!5681) mapDefault!19707)) b!449973))

(assert (= start!40686 b!449961))

(declare-fun m!433459 () Bool)

(assert (=> b!449965 m!433459))

(declare-fun m!433461 () Bool)

(assert (=> b!449963 m!433461))

(declare-fun m!433463 () Bool)

(assert (=> b!449959 m!433463))

(declare-fun m!433465 () Bool)

(assert (=> b!449968 m!433465))

(declare-fun m!433467 () Bool)

(assert (=> bm!29698 m!433467))

(declare-fun m!433469 () Bool)

(assert (=> b!449976 m!433469))

(assert (=> b!449976 m!433469))

(declare-fun m!433471 () Bool)

(assert (=> b!449976 m!433471))

(declare-fun m!433473 () Bool)

(assert (=> b!449976 m!433473))

(declare-fun m!433475 () Bool)

(assert (=> b!449964 m!433475))

(declare-fun m!433477 () Bool)

(assert (=> start!40686 m!433477))

(declare-fun m!433479 () Bool)

(assert (=> start!40686 m!433479))

(declare-fun m!433481 () Bool)

(assert (=> b!449971 m!433481))

(declare-fun m!433483 () Bool)

(assert (=> b!449971 m!433483))

(declare-fun m!433485 () Bool)

(assert (=> b!449971 m!433485))

(declare-fun m!433487 () Bool)

(assert (=> b!449970 m!433487))

(declare-fun m!433489 () Bool)

(assert (=> b!449970 m!433489))

(declare-fun m!433491 () Bool)

(assert (=> b!449960 m!433491))

(declare-fun m!433493 () Bool)

(assert (=> b!449975 m!433493))

(declare-fun m!433495 () Bool)

(assert (=> b!449967 m!433495))

(declare-fun m!433497 () Bool)

(assert (=> mapNonEmpty!19707 m!433497))

(declare-fun m!433499 () Bool)

(assert (=> bm!29697 m!433499))

(check-sat (not b!449965) (not b!449971) b_and!18693 (not start!40686) tp_is_empty!12049 (not b!449976) (not bm!29698) (not b!449975) (not b!449970) (not b!449968) (not b!449964) (not b!449967) (not bm!29697) (not b!449963) (not mapNonEmpty!19707) (not b_next!10711) (not b!449960))
(check-sat b_and!18693 (not b_next!10711))
