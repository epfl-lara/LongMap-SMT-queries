; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40678 () Bool)

(assert start!40678)

(declare-fun b_free!10689 () Bool)

(declare-fun b_next!10689 () Bool)

(assert (=> start!40678 (= b_free!10689 (not b_next!10689))))

(declare-fun tp!37887 () Bool)

(declare-fun b_and!18697 () Bool)

(assert (=> start!40678 (= tp!37887 b_and!18697)))

(declare-fun b!449672 () Bool)

(declare-fun res!267524 () Bool)

(declare-fun e!263623 () Bool)

(assert (=> b!449672 (=> (not res!267524) (not e!263623))))

(declare-datatypes ((array!27861 0))(
  ( (array!27862 (arr!13376 (Array (_ BitVec 32) (_ BitVec 64))) (size!13728 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27861)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449672 (= res!267524 (or (= (select (arr!13376 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13376 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449673 () Bool)

(declare-fun res!267525 () Bool)

(assert (=> b!449673 (=> (not res!267525) (not e!263623))))

(declare-datatypes ((List!8021 0))(
  ( (Nil!8018) (Cons!8017 (h!8873 (_ BitVec 64)) (t!13783 List!8021)) )
))
(declare-fun arrayNoDuplicates!0 (array!27861 (_ BitVec 32) List!8021) Bool)

(assert (=> b!449673 (= res!267525 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8018))))

(declare-fun b!449674 () Bool)

(declare-fun e!263624 () Bool)

(declare-fun e!263622 () Bool)

(declare-fun mapRes!19674 () Bool)

(assert (=> b!449674 (= e!263624 (and e!263622 mapRes!19674))))

(declare-fun condMapEmpty!19674 () Bool)

(declare-datatypes ((V!17141 0))(
  ( (V!17142 (val!6058 Int)) )
))
(declare-datatypes ((ValueCell!5670 0))(
  ( (ValueCellFull!5670 (v!8313 V!17141)) (EmptyCell!5670) )
))
(declare-datatypes ((array!27863 0))(
  ( (array!27864 (arr!13377 (Array (_ BitVec 32) ValueCell!5670)) (size!13729 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27863)

(declare-fun mapDefault!19674 () ValueCell!5670)

(assert (=> b!449674 (= condMapEmpty!19674 (= (arr!13377 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5670)) mapDefault!19674)))))

(declare-fun b!449675 () Bool)

(declare-fun e!263621 () Bool)

(assert (=> b!449675 (= e!263621 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17141)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17141)

(declare-fun v!412 () V!17141)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!204413 () array!27861)

(declare-datatypes ((tuple2!7954 0))(
  ( (tuple2!7955 (_1!3988 (_ BitVec 64)) (_2!3988 V!17141)) )
))
(declare-datatypes ((List!8022 0))(
  ( (Nil!8019) (Cons!8018 (h!8874 tuple2!7954) (t!13784 List!8022)) )
))
(declare-datatypes ((ListLongMap!6867 0))(
  ( (ListLongMap!6868 (toList!3449 List!8022)) )
))
(declare-fun lt!204412 () ListLongMap!6867)

(declare-fun getCurrentListMapNoExtraKeys!1635 (array!27861 array!27863 (_ BitVec 32) (_ BitVec 32) V!17141 V!17141 (_ BitVec 32) Int) ListLongMap!6867)

(assert (=> b!449675 (= lt!204412 (getCurrentListMapNoExtraKeys!1635 lt!204413 (array!27864 (store (arr!13377 _values!549) i!563 (ValueCellFull!5670 v!412)) (size!13729 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204414 () ListLongMap!6867)

(assert (=> b!449675 (= lt!204414 (getCurrentListMapNoExtraKeys!1635 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!449676 () Bool)

(assert (=> b!449676 (= e!263623 e!263621)))

(declare-fun res!267523 () Bool)

(assert (=> b!449676 (=> (not res!267523) (not e!263621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27861 (_ BitVec 32)) Bool)

(assert (=> b!449676 (= res!267523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204413 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!449676 (= lt!204413 (array!27862 (store (arr!13376 _keys!709) i!563 k0!794) (size!13728 _keys!709)))))

(declare-fun b!449678 () Bool)

(declare-fun res!267529 () Bool)

(assert (=> b!449678 (=> (not res!267529) (not e!263623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449678 (= res!267529 (validKeyInArray!0 k0!794))))

(declare-fun b!449679 () Bool)

(declare-fun res!267526 () Bool)

(assert (=> b!449679 (=> (not res!267526) (not e!263623))))

(assert (=> b!449679 (= res!267526 (and (= (size!13729 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13728 _keys!709) (size!13729 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449680 () Bool)

(declare-fun res!267521 () Bool)

(assert (=> b!449680 (=> (not res!267521) (not e!263623))))

(assert (=> b!449680 (= res!267521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449681 () Bool)

(declare-fun res!267528 () Bool)

(assert (=> b!449681 (=> (not res!267528) (not e!263623))))

(declare-fun arrayContainsKey!0 (array!27861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449681 (= res!267528 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19674 () Bool)

(assert (=> mapIsEmpty!19674 mapRes!19674))

(declare-fun b!449682 () Bool)

(declare-fun res!267527 () Bool)

(assert (=> b!449682 (=> (not res!267527) (not e!263621))))

(assert (=> b!449682 (= res!267527 (arrayNoDuplicates!0 lt!204413 #b00000000000000000000000000000000 Nil!8018))))

(declare-fun mapNonEmpty!19674 () Bool)

(declare-fun tp!37886 () Bool)

(declare-fun e!263620 () Bool)

(assert (=> mapNonEmpty!19674 (= mapRes!19674 (and tp!37886 e!263620))))

(declare-fun mapValue!19674 () ValueCell!5670)

(declare-fun mapKey!19674 () (_ BitVec 32))

(declare-fun mapRest!19674 () (Array (_ BitVec 32) ValueCell!5670))

(assert (=> mapNonEmpty!19674 (= (arr!13377 _values!549) (store mapRest!19674 mapKey!19674 mapValue!19674))))

(declare-fun b!449683 () Bool)

(declare-fun res!267522 () Bool)

(assert (=> b!449683 (=> (not res!267522) (not e!263623))))

(assert (=> b!449683 (= res!267522 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13728 _keys!709))))))

(declare-fun b!449684 () Bool)

(declare-fun tp_is_empty!12027 () Bool)

(assert (=> b!449684 (= e!263620 tp_is_empty!12027)))

(declare-fun res!267531 () Bool)

(assert (=> start!40678 (=> (not res!267531) (not e!263623))))

(assert (=> start!40678 (= res!267531 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13728 _keys!709))))))

(assert (=> start!40678 e!263623))

(assert (=> start!40678 tp_is_empty!12027))

(assert (=> start!40678 tp!37887))

(assert (=> start!40678 true))

(declare-fun array_inv!9692 (array!27863) Bool)

(assert (=> start!40678 (and (array_inv!9692 _values!549) e!263624)))

(declare-fun array_inv!9693 (array!27861) Bool)

(assert (=> start!40678 (array_inv!9693 _keys!709)))

(declare-fun b!449677 () Bool)

(declare-fun res!267520 () Bool)

(assert (=> b!449677 (=> (not res!267520) (not e!263621))))

(assert (=> b!449677 (= res!267520 (bvsle from!863 i!563))))

(declare-fun b!449685 () Bool)

(assert (=> b!449685 (= e!263622 tp_is_empty!12027)))

(declare-fun b!449686 () Bool)

(declare-fun res!267530 () Bool)

(assert (=> b!449686 (=> (not res!267530) (not e!263623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449686 (= res!267530 (validMask!0 mask!1025))))

(assert (= (and start!40678 res!267531) b!449686))

(assert (= (and b!449686 res!267530) b!449679))

(assert (= (and b!449679 res!267526) b!449680))

(assert (= (and b!449680 res!267521) b!449673))

(assert (= (and b!449673 res!267525) b!449683))

(assert (= (and b!449683 res!267522) b!449678))

(assert (= (and b!449678 res!267529) b!449672))

(assert (= (and b!449672 res!267524) b!449681))

(assert (= (and b!449681 res!267528) b!449676))

(assert (= (and b!449676 res!267523) b!449682))

(assert (= (and b!449682 res!267527) b!449677))

(assert (= (and b!449677 res!267520) b!449675))

(assert (= (and b!449674 condMapEmpty!19674) mapIsEmpty!19674))

(assert (= (and b!449674 (not condMapEmpty!19674)) mapNonEmpty!19674))

(get-info :version)

(assert (= (and mapNonEmpty!19674 ((_ is ValueCellFull!5670) mapValue!19674)) b!449684))

(assert (= (and b!449674 ((_ is ValueCellFull!5670) mapDefault!19674)) b!449685))

(assert (= start!40678 b!449674))

(declare-fun m!433813 () Bool)

(assert (=> mapNonEmpty!19674 m!433813))

(declare-fun m!433815 () Bool)

(assert (=> b!449681 m!433815))

(declare-fun m!433817 () Bool)

(assert (=> b!449675 m!433817))

(declare-fun m!433819 () Bool)

(assert (=> b!449675 m!433819))

(declare-fun m!433821 () Bool)

(assert (=> b!449675 m!433821))

(declare-fun m!433823 () Bool)

(assert (=> b!449680 m!433823))

(declare-fun m!433825 () Bool)

(assert (=> b!449676 m!433825))

(declare-fun m!433827 () Bool)

(assert (=> b!449676 m!433827))

(declare-fun m!433829 () Bool)

(assert (=> start!40678 m!433829))

(declare-fun m!433831 () Bool)

(assert (=> start!40678 m!433831))

(declare-fun m!433833 () Bool)

(assert (=> b!449686 m!433833))

(declare-fun m!433835 () Bool)

(assert (=> b!449673 m!433835))

(declare-fun m!433837 () Bool)

(assert (=> b!449682 m!433837))

(declare-fun m!433839 () Bool)

(assert (=> b!449672 m!433839))

(declare-fun m!433841 () Bool)

(assert (=> b!449678 m!433841))

(check-sat (not b!449680) (not b!449682) (not b_next!10689) (not b!449686) tp_is_empty!12027 (not start!40678) (not b!449678) (not b!449673) (not b!449676) b_and!18697 (not b!449681) (not mapNonEmpty!19674) (not b!449675))
(check-sat b_and!18697 (not b_next!10689))
