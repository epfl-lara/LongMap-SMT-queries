; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40606 () Bool)

(assert start!40606)

(declare-fun b_free!10617 () Bool)

(declare-fun b_next!10617 () Bool)

(assert (=> start!40606 (= b_free!10617 (not b_next!10617))))

(declare-fun tp!37670 () Bool)

(declare-fun b_and!18625 () Bool)

(assert (=> start!40606 (= tp!37670 b_and!18625)))

(declare-fun b!448052 () Bool)

(declare-fun e!262976 () Bool)

(declare-fun e!262973 () Bool)

(declare-fun mapRes!19566 () Bool)

(assert (=> b!448052 (= e!262976 (and e!262973 mapRes!19566))))

(declare-fun condMapEmpty!19566 () Bool)

(declare-datatypes ((V!17045 0))(
  ( (V!17046 (val!6022 Int)) )
))
(declare-datatypes ((ValueCell!5634 0))(
  ( (ValueCellFull!5634 (v!8277 V!17045)) (EmptyCell!5634) )
))
(declare-datatypes ((array!27717 0))(
  ( (array!27718 (arr!13304 (Array (_ BitVec 32) ValueCell!5634)) (size!13656 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27717)

(declare-fun mapDefault!19566 () ValueCell!5634)

(assert (=> b!448052 (= condMapEmpty!19566 (= (arr!13304 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5634)) mapDefault!19566)))))

(declare-fun b!448053 () Bool)

(declare-fun res!266228 () Bool)

(declare-fun e!262975 () Bool)

(assert (=> b!448053 (=> (not res!266228) (not e!262975))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448053 (= res!266228 (validKeyInArray!0 k0!794))))

(declare-fun b!448054 () Bool)

(declare-fun res!266226 () Bool)

(assert (=> b!448054 (=> (not res!266226) (not e!262975))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27719 0))(
  ( (array!27720 (arr!13305 (Array (_ BitVec 32) (_ BitVec 64))) (size!13657 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27719)

(assert (=> b!448054 (= res!266226 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13657 _keys!709))))))

(declare-fun res!266227 () Bool)

(assert (=> start!40606 (=> (not res!266227) (not e!262975))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40606 (= res!266227 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13657 _keys!709))))))

(assert (=> start!40606 e!262975))

(declare-fun tp_is_empty!11955 () Bool)

(assert (=> start!40606 tp_is_empty!11955))

(assert (=> start!40606 tp!37670))

(assert (=> start!40606 true))

(declare-fun array_inv!9640 (array!27717) Bool)

(assert (=> start!40606 (and (array_inv!9640 _values!549) e!262976)))

(declare-fun array_inv!9641 (array!27719) Bool)

(assert (=> start!40606 (array_inv!9641 _keys!709)))

(declare-fun mapIsEmpty!19566 () Bool)

(assert (=> mapIsEmpty!19566 mapRes!19566))

(declare-fun b!448055 () Bool)

(declare-fun e!262972 () Bool)

(assert (=> b!448055 (= e!262975 e!262972)))

(declare-fun res!266232 () Bool)

(assert (=> b!448055 (=> (not res!266232) (not e!262972))))

(declare-fun lt!204089 () array!27719)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27719 (_ BitVec 32)) Bool)

(assert (=> b!448055 (= res!266232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204089 mask!1025))))

(assert (=> b!448055 (= lt!204089 (array!27720 (store (arr!13305 _keys!709) i!563 k0!794) (size!13657 _keys!709)))))

(declare-fun b!448056 () Bool)

(declare-fun res!266233 () Bool)

(assert (=> b!448056 (=> (not res!266233) (not e!262975))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!448056 (= res!266233 (and (= (size!13656 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13657 _keys!709) (size!13656 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448057 () Bool)

(declare-fun res!266229 () Bool)

(assert (=> b!448057 (=> (not res!266229) (not e!262975))))

(assert (=> b!448057 (= res!266229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448058 () Bool)

(declare-fun res!266231 () Bool)

(assert (=> b!448058 (=> (not res!266231) (not e!262972))))

(declare-datatypes ((List!7963 0))(
  ( (Nil!7960) (Cons!7959 (h!8815 (_ BitVec 64)) (t!13725 List!7963)) )
))
(declare-fun arrayNoDuplicates!0 (array!27719 (_ BitVec 32) List!7963) Bool)

(assert (=> b!448058 (= res!266231 (arrayNoDuplicates!0 lt!204089 #b00000000000000000000000000000000 Nil!7960))))

(declare-fun b!448059 () Bool)

(declare-fun e!262971 () Bool)

(assert (=> b!448059 (= e!262971 tp_is_empty!11955)))

(declare-fun b!448060 () Bool)

(assert (=> b!448060 (= e!262973 tp_is_empty!11955)))

(declare-fun b!448061 () Bool)

(declare-fun res!266234 () Bool)

(assert (=> b!448061 (=> (not res!266234) (not e!262975))))

(declare-fun arrayContainsKey!0 (array!27719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448061 (= res!266234 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448062 () Bool)

(declare-fun res!266224 () Bool)

(assert (=> b!448062 (=> (not res!266224) (not e!262975))))

(assert (=> b!448062 (= res!266224 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7960))))

(declare-fun mapNonEmpty!19566 () Bool)

(declare-fun tp!37671 () Bool)

(assert (=> mapNonEmpty!19566 (= mapRes!19566 (and tp!37671 e!262971))))

(declare-fun mapValue!19566 () ValueCell!5634)

(declare-fun mapKey!19566 () (_ BitVec 32))

(declare-fun mapRest!19566 () (Array (_ BitVec 32) ValueCell!5634))

(assert (=> mapNonEmpty!19566 (= (arr!13304 _values!549) (store mapRest!19566 mapKey!19566 mapValue!19566))))

(declare-fun b!448063 () Bool)

(declare-fun res!266235 () Bool)

(assert (=> b!448063 (=> (not res!266235) (not e!262975))))

(assert (=> b!448063 (= res!266235 (or (= (select (arr!13305 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13305 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448064 () Bool)

(declare-fun res!266230 () Bool)

(assert (=> b!448064 (=> (not res!266230) (not e!262975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448064 (= res!266230 (validMask!0 mask!1025))))

(declare-fun b!448065 () Bool)

(declare-fun res!266225 () Bool)

(assert (=> b!448065 (=> (not res!266225) (not e!262972))))

(assert (=> b!448065 (= res!266225 (bvsle from!863 i!563))))

(declare-fun b!448066 () Bool)

(assert (=> b!448066 (= e!262972 false)))

(declare-fun minValue!515 () V!17045)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7898 0))(
  ( (tuple2!7899 (_1!3960 (_ BitVec 64)) (_2!3960 V!17045)) )
))
(declare-datatypes ((List!7964 0))(
  ( (Nil!7961) (Cons!7960 (h!8816 tuple2!7898) (t!13726 List!7964)) )
))
(declare-datatypes ((ListLongMap!6811 0))(
  ( (ListLongMap!6812 (toList!3421 List!7964)) )
))
(declare-fun lt!204088 () ListLongMap!6811)

(declare-fun zeroValue!515 () V!17045)

(declare-fun v!412 () V!17045)

(declare-fun getCurrentListMapNoExtraKeys!1607 (array!27719 array!27717 (_ BitVec 32) (_ BitVec 32) V!17045 V!17045 (_ BitVec 32) Int) ListLongMap!6811)

(assert (=> b!448066 (= lt!204088 (getCurrentListMapNoExtraKeys!1607 lt!204089 (array!27718 (store (arr!13304 _values!549) i!563 (ValueCellFull!5634 v!412)) (size!13656 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204090 () ListLongMap!6811)

(assert (=> b!448066 (= lt!204090 (getCurrentListMapNoExtraKeys!1607 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40606 res!266227) b!448064))

(assert (= (and b!448064 res!266230) b!448056))

(assert (= (and b!448056 res!266233) b!448057))

(assert (= (and b!448057 res!266229) b!448062))

(assert (= (and b!448062 res!266224) b!448054))

(assert (= (and b!448054 res!266226) b!448053))

(assert (= (and b!448053 res!266228) b!448063))

(assert (= (and b!448063 res!266235) b!448061))

(assert (= (and b!448061 res!266234) b!448055))

(assert (= (and b!448055 res!266232) b!448058))

(assert (= (and b!448058 res!266231) b!448065))

(assert (= (and b!448065 res!266225) b!448066))

(assert (= (and b!448052 condMapEmpty!19566) mapIsEmpty!19566))

(assert (= (and b!448052 (not condMapEmpty!19566)) mapNonEmpty!19566))

(get-info :version)

(assert (= (and mapNonEmpty!19566 ((_ is ValueCellFull!5634) mapValue!19566)) b!448059))

(assert (= (and b!448052 ((_ is ValueCellFull!5634) mapDefault!19566)) b!448060))

(assert (= start!40606 b!448052))

(declare-fun m!432733 () Bool)

(assert (=> b!448066 m!432733))

(declare-fun m!432735 () Bool)

(assert (=> b!448066 m!432735))

(declare-fun m!432737 () Bool)

(assert (=> b!448066 m!432737))

(declare-fun m!432739 () Bool)

(assert (=> b!448055 m!432739))

(declare-fun m!432741 () Bool)

(assert (=> b!448055 m!432741))

(declare-fun m!432743 () Bool)

(assert (=> start!40606 m!432743))

(declare-fun m!432745 () Bool)

(assert (=> start!40606 m!432745))

(declare-fun m!432747 () Bool)

(assert (=> b!448064 m!432747))

(declare-fun m!432749 () Bool)

(assert (=> b!448057 m!432749))

(declare-fun m!432751 () Bool)

(assert (=> b!448058 m!432751))

(declare-fun m!432753 () Bool)

(assert (=> b!448053 m!432753))

(declare-fun m!432755 () Bool)

(assert (=> b!448062 m!432755))

(declare-fun m!432757 () Bool)

(assert (=> mapNonEmpty!19566 m!432757))

(declare-fun m!432759 () Bool)

(assert (=> b!448063 m!432759))

(declare-fun m!432761 () Bool)

(assert (=> b!448061 m!432761))

(check-sat (not b!448066) (not mapNonEmpty!19566) (not b!448061) (not b!448064) (not b_next!10617) b_and!18625 (not b!448057) (not b!448053) (not b!448055) (not start!40606) tp_is_empty!11955 (not b!448062) (not b!448058))
(check-sat b_and!18625 (not b_next!10617))
