; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40600 () Bool)

(assert start!40600)

(declare-fun b_free!10611 () Bool)

(declare-fun b_next!10611 () Bool)

(assert (=> start!40600 (= b_free!10611 (not b_next!10611))))

(declare-fun tp!37652 () Bool)

(declare-fun b_and!18619 () Bool)

(assert (=> start!40600 (= tp!37652 b_and!18619)))

(declare-fun b!447917 () Bool)

(declare-fun res!266126 () Bool)

(declare-fun e!262921 () Bool)

(assert (=> b!447917 (=> (not res!266126) (not e!262921))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27705 0))(
  ( (array!27706 (arr!13298 (Array (_ BitVec 32) (_ BitVec 64))) (size!13650 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27705)

(assert (=> b!447917 (= res!266126 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13650 _keys!709))))))

(declare-fun b!447918 () Bool)

(declare-fun res!266117 () Bool)

(assert (=> b!447918 (=> (not res!266117) (not e!262921))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447918 (= res!266117 (validKeyInArray!0 k0!794))))

(declare-fun b!447919 () Bool)

(declare-fun e!262922 () Bool)

(assert (=> b!447919 (= e!262921 e!262922)))

(declare-fun res!266123 () Bool)

(assert (=> b!447919 (=> (not res!266123) (not e!262922))))

(declare-fun lt!204061 () array!27705)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27705 (_ BitVec 32)) Bool)

(assert (=> b!447919 (= res!266123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204061 mask!1025))))

(assert (=> b!447919 (= lt!204061 (array!27706 (store (arr!13298 _keys!709) i!563 k0!794) (size!13650 _keys!709)))))

(declare-fun b!447920 () Bool)

(declare-fun e!262920 () Bool)

(declare-fun tp_is_empty!11949 () Bool)

(assert (=> b!447920 (= e!262920 tp_is_empty!11949)))

(declare-fun b!447922 () Bool)

(declare-fun res!266121 () Bool)

(assert (=> b!447922 (=> (not res!266121) (not e!262921))))

(declare-fun arrayContainsKey!0 (array!27705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447922 (= res!266121 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19557 () Bool)

(declare-fun mapRes!19557 () Bool)

(declare-fun tp!37653 () Bool)

(assert (=> mapNonEmpty!19557 (= mapRes!19557 (and tp!37653 e!262920))))

(declare-datatypes ((V!17037 0))(
  ( (V!17038 (val!6019 Int)) )
))
(declare-datatypes ((ValueCell!5631 0))(
  ( (ValueCellFull!5631 (v!8274 V!17037)) (EmptyCell!5631) )
))
(declare-datatypes ((array!27707 0))(
  ( (array!27708 (arr!13299 (Array (_ BitVec 32) ValueCell!5631)) (size!13651 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27707)

(declare-fun mapKey!19557 () (_ BitVec 32))

(declare-fun mapValue!19557 () ValueCell!5631)

(declare-fun mapRest!19557 () (Array (_ BitVec 32) ValueCell!5631))

(assert (=> mapNonEmpty!19557 (= (arr!13299 _values!549) (store mapRest!19557 mapKey!19557 mapValue!19557))))

(declare-fun b!447923 () Bool)

(declare-fun res!266122 () Bool)

(assert (=> b!447923 (=> (not res!266122) (not e!262921))))

(declare-datatypes ((List!7957 0))(
  ( (Nil!7954) (Cons!7953 (h!8809 (_ BitVec 64)) (t!13719 List!7957)) )
))
(declare-fun arrayNoDuplicates!0 (array!27705 (_ BitVec 32) List!7957) Bool)

(assert (=> b!447923 (= res!266122 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7954))))

(declare-fun b!447924 () Bool)

(declare-fun e!262917 () Bool)

(assert (=> b!447924 (= e!262917 tp_is_empty!11949)))

(declare-fun b!447925 () Bool)

(assert (=> b!447925 (= e!262922 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7892 0))(
  ( (tuple2!7893 (_1!3957 (_ BitVec 64)) (_2!3957 V!17037)) )
))
(declare-datatypes ((List!7958 0))(
  ( (Nil!7955) (Cons!7954 (h!8810 tuple2!7892) (t!13720 List!7958)) )
))
(declare-datatypes ((ListLongMap!6805 0))(
  ( (ListLongMap!6806 (toList!3418 List!7958)) )
))
(declare-fun lt!204062 () ListLongMap!6805)

(declare-fun minValue!515 () V!17037)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17037)

(declare-fun v!412 () V!17037)

(declare-fun getCurrentListMapNoExtraKeys!1604 (array!27705 array!27707 (_ BitVec 32) (_ BitVec 32) V!17037 V!17037 (_ BitVec 32) Int) ListLongMap!6805)

(assert (=> b!447925 (= lt!204062 (getCurrentListMapNoExtraKeys!1604 lt!204061 (array!27708 (store (arr!13299 _values!549) i!563 (ValueCellFull!5631 v!412)) (size!13651 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204063 () ListLongMap!6805)

(assert (=> b!447925 (= lt!204063 (getCurrentListMapNoExtraKeys!1604 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447926 () Bool)

(declare-fun res!266120 () Bool)

(assert (=> b!447926 (=> (not res!266120) (not e!262921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447926 (= res!266120 (validMask!0 mask!1025))))

(declare-fun b!447927 () Bool)

(declare-fun res!266118 () Bool)

(assert (=> b!447927 (=> (not res!266118) (not e!262921))))

(assert (=> b!447927 (= res!266118 (or (= (select (arr!13298 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13298 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447928 () Bool)

(declare-fun res!266116 () Bool)

(assert (=> b!447928 (=> (not res!266116) (not e!262922))))

(assert (=> b!447928 (= res!266116 (arrayNoDuplicates!0 lt!204061 #b00000000000000000000000000000000 Nil!7954))))

(declare-fun res!266124 () Bool)

(assert (=> start!40600 (=> (not res!266124) (not e!262921))))

(assert (=> start!40600 (= res!266124 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13650 _keys!709))))))

(assert (=> start!40600 e!262921))

(assert (=> start!40600 tp_is_empty!11949))

(assert (=> start!40600 tp!37652))

(assert (=> start!40600 true))

(declare-fun e!262919 () Bool)

(declare-fun array_inv!9636 (array!27707) Bool)

(assert (=> start!40600 (and (array_inv!9636 _values!549) e!262919)))

(declare-fun array_inv!9637 (array!27705) Bool)

(assert (=> start!40600 (array_inv!9637 _keys!709)))

(declare-fun b!447921 () Bool)

(assert (=> b!447921 (= e!262919 (and e!262917 mapRes!19557))))

(declare-fun condMapEmpty!19557 () Bool)

(declare-fun mapDefault!19557 () ValueCell!5631)

(assert (=> b!447921 (= condMapEmpty!19557 (= (arr!13299 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5631)) mapDefault!19557)))))

(declare-fun b!447929 () Bool)

(declare-fun res!266119 () Bool)

(assert (=> b!447929 (=> (not res!266119) (not e!262921))))

(assert (=> b!447929 (= res!266119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447930 () Bool)

(declare-fun res!266125 () Bool)

(assert (=> b!447930 (=> (not res!266125) (not e!262922))))

(assert (=> b!447930 (= res!266125 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19557 () Bool)

(assert (=> mapIsEmpty!19557 mapRes!19557))

(declare-fun b!447931 () Bool)

(declare-fun res!266127 () Bool)

(assert (=> b!447931 (=> (not res!266127) (not e!262921))))

(assert (=> b!447931 (= res!266127 (and (= (size!13651 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13650 _keys!709) (size!13651 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40600 res!266124) b!447926))

(assert (= (and b!447926 res!266120) b!447931))

(assert (= (and b!447931 res!266127) b!447929))

(assert (= (and b!447929 res!266119) b!447923))

(assert (= (and b!447923 res!266122) b!447917))

(assert (= (and b!447917 res!266126) b!447918))

(assert (= (and b!447918 res!266117) b!447927))

(assert (= (and b!447927 res!266118) b!447922))

(assert (= (and b!447922 res!266121) b!447919))

(assert (= (and b!447919 res!266123) b!447928))

(assert (= (and b!447928 res!266116) b!447930))

(assert (= (and b!447930 res!266125) b!447925))

(assert (= (and b!447921 condMapEmpty!19557) mapIsEmpty!19557))

(assert (= (and b!447921 (not condMapEmpty!19557)) mapNonEmpty!19557))

(get-info :version)

(assert (= (and mapNonEmpty!19557 ((_ is ValueCellFull!5631) mapValue!19557)) b!447920))

(assert (= (and b!447921 ((_ is ValueCellFull!5631) mapDefault!19557)) b!447924))

(assert (= start!40600 b!447921))

(declare-fun m!432643 () Bool)

(assert (=> start!40600 m!432643))

(declare-fun m!432645 () Bool)

(assert (=> start!40600 m!432645))

(declare-fun m!432647 () Bool)

(assert (=> b!447922 m!432647))

(declare-fun m!432649 () Bool)

(assert (=> b!447923 m!432649))

(declare-fun m!432651 () Bool)

(assert (=> b!447926 m!432651))

(declare-fun m!432653 () Bool)

(assert (=> b!447919 m!432653))

(declare-fun m!432655 () Bool)

(assert (=> b!447919 m!432655))

(declare-fun m!432657 () Bool)

(assert (=> mapNonEmpty!19557 m!432657))

(declare-fun m!432659 () Bool)

(assert (=> b!447929 m!432659))

(declare-fun m!432661 () Bool)

(assert (=> b!447927 m!432661))

(declare-fun m!432663 () Bool)

(assert (=> b!447918 m!432663))

(declare-fun m!432665 () Bool)

(assert (=> b!447925 m!432665))

(declare-fun m!432667 () Bool)

(assert (=> b!447925 m!432667))

(declare-fun m!432669 () Bool)

(assert (=> b!447925 m!432669))

(declare-fun m!432671 () Bool)

(assert (=> b!447928 m!432671))

(check-sat (not b!447928) b_and!18619 tp_is_empty!11949 (not b!447918) (not start!40600) (not b!447925) (not b_next!10611) (not b!447926) (not b!447922) (not b!447923) (not mapNonEmpty!19557) (not b!447929) (not b!447919))
(check-sat b_and!18619 (not b_next!10611))
