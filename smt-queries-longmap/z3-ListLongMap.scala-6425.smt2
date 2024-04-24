; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82514 () Bool)

(assert start!82514)

(declare-fun b_free!18613 () Bool)

(declare-fun b_next!18613 () Bool)

(assert (=> start!82514 (= b_free!18613 (not b_next!18613))))

(declare-fun tp!64809 () Bool)

(declare-fun b_and!30111 () Bool)

(assert (=> start!82514 (= tp!64809 b_and!30111)))

(declare-fun mapNonEmpty!33967 () Bool)

(declare-fun mapRes!33967 () Bool)

(declare-fun tp!64810 () Bool)

(declare-fun e!541796 () Bool)

(assert (=> mapNonEmpty!33967 (= mapRes!33967 (and tp!64810 e!541796))))

(declare-datatypes ((V!33417 0))(
  ( (V!33418 (val!10713 Int)) )
))
(declare-datatypes ((ValueCell!10181 0))(
  ( (ValueCellFull!10181 (v!13267 V!33417)) (EmptyCell!10181) )
))
(declare-datatypes ((array!58772 0))(
  ( (array!58773 (arr!28255 (Array (_ BitVec 32) ValueCell!10181)) (size!28735 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58772)

(declare-fun mapKey!33967 () (_ BitVec 32))

(declare-fun mapRest!33967 () (Array (_ BitVec 32) ValueCell!10181))

(declare-fun mapValue!33967 () ValueCell!10181)

(assert (=> mapNonEmpty!33967 (= (arr!28255 _values!1386) (store mapRest!33967 mapKey!33967 mapValue!33967))))

(declare-fun b!961001 () Bool)

(declare-fun res!643020 () Bool)

(declare-fun e!541795 () Bool)

(assert (=> b!961001 (=> (not res!643020) (not e!541795))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58774 0))(
  ( (array!58775 (arr!28256 (Array (_ BitVec 32) (_ BitVec 64))) (size!28736 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58774)

(assert (=> b!961001 (= res!643020 (and (= (size!28735 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28736 _keys!1668) (size!28735 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun res!643019 () Bool)

(assert (=> start!82514 (=> (not res!643019) (not e!541795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82514 (= res!643019 (validMask!0 mask!2088))))

(assert (=> start!82514 e!541795))

(assert (=> start!82514 true))

(declare-fun tp_is_empty!21325 () Bool)

(assert (=> start!82514 tp_is_empty!21325))

(declare-fun array_inv!21981 (array!58774) Bool)

(assert (=> start!82514 (array_inv!21981 _keys!1668)))

(declare-fun e!541797 () Bool)

(declare-fun array_inv!21982 (array!58772) Bool)

(assert (=> start!82514 (and (array_inv!21982 _values!1386) e!541797)))

(assert (=> start!82514 tp!64809))

(declare-fun b!961002 () Bool)

(declare-fun e!541794 () Bool)

(assert (=> b!961002 (= e!541797 (and e!541794 mapRes!33967))))

(declare-fun condMapEmpty!33967 () Bool)

(declare-fun mapDefault!33967 () ValueCell!10181)

(assert (=> b!961002 (= condMapEmpty!33967 (= (arr!28255 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10181)) mapDefault!33967)))))

(declare-fun b!961003 () Bool)

(declare-fun res!643016 () Bool)

(assert (=> b!961003 (=> (not res!643016) (not e!541795))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961003 (= res!643016 (validKeyInArray!0 (select (arr!28256 _keys!1668) i!793)))))

(declare-fun b!961004 () Bool)

(declare-fun res!643021 () Bool)

(assert (=> b!961004 (=> (not res!643021) (not e!541795))))

(declare-fun from!2064 () (_ BitVec 32))

(assert (=> b!961004 (= res!643021 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28736 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28736 _keys!1668))))))

(declare-fun b!961005 () Bool)

(declare-fun res!643018 () Bool)

(assert (=> b!961005 (=> (not res!643018) (not e!541795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58774 (_ BitVec 32)) Bool)

(assert (=> b!961005 (= res!643018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!961006 () Bool)

(assert (=> b!961006 (= e!541794 tp_is_empty!21325)))

(declare-fun b!961007 () Bool)

(assert (=> b!961007 (= e!541795 false)))

(declare-fun lt!430972 () Bool)

(declare-fun minValue!1328 () V!33417)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33417)

(declare-datatypes ((tuple2!13800 0))(
  ( (tuple2!13801 (_1!6911 (_ BitVec 64)) (_2!6911 V!33417)) )
))
(declare-datatypes ((List!19630 0))(
  ( (Nil!19627) (Cons!19626 (h!20794 tuple2!13800) (t!27985 List!19630)) )
))
(declare-datatypes ((ListLongMap!12499 0))(
  ( (ListLongMap!12500 (toList!6265 List!19630)) )
))
(declare-fun contains!5377 (ListLongMap!12499 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3498 (array!58774 array!58772 (_ BitVec 32) (_ BitVec 32) V!33417 V!33417 (_ BitVec 32) Int) ListLongMap!12499)

(assert (=> b!961007 (= lt!430972 (contains!5377 (getCurrentListMap!3498 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28256 _keys!1668) i!793)))))

(declare-fun b!961008 () Bool)

(assert (=> b!961008 (= e!541796 tp_is_empty!21325)))

(declare-fun b!961009 () Bool)

(declare-fun res!643017 () Bool)

(assert (=> b!961009 (=> (not res!643017) (not e!541795))))

(declare-datatypes ((List!19631 0))(
  ( (Nil!19628) (Cons!19627 (h!20795 (_ BitVec 64)) (t!27986 List!19631)) )
))
(declare-fun arrayNoDuplicates!0 (array!58774 (_ BitVec 32) List!19631) Bool)

(assert (=> b!961009 (= res!643017 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19628))))

(declare-fun mapIsEmpty!33967 () Bool)

(assert (=> mapIsEmpty!33967 mapRes!33967))

(assert (= (and start!82514 res!643019) b!961001))

(assert (= (and b!961001 res!643020) b!961005))

(assert (= (and b!961005 res!643018) b!961009))

(assert (= (and b!961009 res!643017) b!961004))

(assert (= (and b!961004 res!643021) b!961003))

(assert (= (and b!961003 res!643016) b!961007))

(assert (= (and b!961002 condMapEmpty!33967) mapIsEmpty!33967))

(assert (= (and b!961002 (not condMapEmpty!33967)) mapNonEmpty!33967))

(get-info :version)

(assert (= (and mapNonEmpty!33967 ((_ is ValueCellFull!10181) mapValue!33967)) b!961008))

(assert (= (and b!961002 ((_ is ValueCellFull!10181) mapDefault!33967)) b!961006))

(assert (= start!82514 b!961002))

(declare-fun m!891723 () Bool)

(assert (=> b!961003 m!891723))

(assert (=> b!961003 m!891723))

(declare-fun m!891725 () Bool)

(assert (=> b!961003 m!891725))

(declare-fun m!891727 () Bool)

(assert (=> b!961009 m!891727))

(declare-fun m!891729 () Bool)

(assert (=> b!961007 m!891729))

(assert (=> b!961007 m!891723))

(assert (=> b!961007 m!891729))

(assert (=> b!961007 m!891723))

(declare-fun m!891731 () Bool)

(assert (=> b!961007 m!891731))

(declare-fun m!891733 () Bool)

(assert (=> b!961005 m!891733))

(declare-fun m!891735 () Bool)

(assert (=> mapNonEmpty!33967 m!891735))

(declare-fun m!891737 () Bool)

(assert (=> start!82514 m!891737))

(declare-fun m!891739 () Bool)

(assert (=> start!82514 m!891739))

(declare-fun m!891741 () Bool)

(assert (=> start!82514 m!891741))

(check-sat (not b!961009) (not b_next!18613) (not b!961005) (not start!82514) (not b!961003) b_and!30111 (not b!961007) tp_is_empty!21325 (not mapNonEmpty!33967))
(check-sat b_and!30111 (not b_next!18613))
