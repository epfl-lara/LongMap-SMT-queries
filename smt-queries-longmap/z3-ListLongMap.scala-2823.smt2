; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40904 () Bool)

(assert start!40904)

(declare-fun b_free!10839 () Bool)

(declare-fun b_next!10839 () Bool)

(assert (=> start!40904 (= b_free!10839 (not b_next!10839))))

(declare-fun tp!38344 () Bool)

(declare-fun b_and!18981 () Bool)

(assert (=> start!40904 (= tp!38344 b_and!18981)))

(declare-fun b!454502 () Bool)

(declare-fun res!270826 () Bool)

(declare-fun e!265905 () Bool)

(assert (=> b!454502 (=> (not res!270826) (not e!265905))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454502 (= res!270826 (bvsle from!863 i!563))))

(declare-fun b!454503 () Bool)

(declare-fun res!270827 () Bool)

(declare-fun e!265909 () Bool)

(assert (=> b!454503 (=> (not res!270827) (not e!265909))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454503 (= res!270827 (validMask!0 mask!1025))))

(declare-fun b!454504 () Bool)

(declare-fun e!265904 () Bool)

(declare-fun tp_is_empty!12177 () Bool)

(assert (=> b!454504 (= e!265904 tp_is_empty!12177)))

(declare-fun b!454505 () Bool)

(declare-fun res!270825 () Bool)

(assert (=> b!454505 (=> (not res!270825) (not e!265909))))

(declare-datatypes ((array!28159 0))(
  ( (array!28160 (arr!13523 (Array (_ BitVec 32) (_ BitVec 64))) (size!13875 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28159)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454505 (= res!270825 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454506 () Bool)

(declare-fun res!270824 () Bool)

(assert (=> b!454506 (=> (not res!270824) (not e!265909))))

(assert (=> b!454506 (= res!270824 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13875 _keys!709))))))

(declare-fun res!270819 () Bool)

(assert (=> start!40904 (=> (not res!270819) (not e!265909))))

(assert (=> start!40904 (= res!270819 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13875 _keys!709))))))

(assert (=> start!40904 e!265909))

(assert (=> start!40904 tp_is_empty!12177))

(assert (=> start!40904 tp!38344))

(assert (=> start!40904 true))

(declare-datatypes ((V!17341 0))(
  ( (V!17342 (val!6133 Int)) )
))
(declare-datatypes ((ValueCell!5745 0))(
  ( (ValueCellFull!5745 (v!8399 V!17341)) (EmptyCell!5745) )
))
(declare-datatypes ((array!28161 0))(
  ( (array!28162 (arr!13524 (Array (_ BitVec 32) ValueCell!5745)) (size!13876 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28161)

(declare-fun e!265908 () Bool)

(declare-fun array_inv!9796 (array!28161) Bool)

(assert (=> start!40904 (and (array_inv!9796 _values!549) e!265908)))

(declare-fun array_inv!9797 (array!28159) Bool)

(assert (=> start!40904 (array_inv!9797 _keys!709)))

(declare-fun mapNonEmpty!19906 () Bool)

(declare-fun mapRes!19906 () Bool)

(declare-fun tp!38343 () Bool)

(declare-fun e!265906 () Bool)

(assert (=> mapNonEmpty!19906 (= mapRes!19906 (and tp!38343 e!265906))))

(declare-fun mapRest!19906 () (Array (_ BitVec 32) ValueCell!5745))

(declare-fun mapValue!19906 () ValueCell!5745)

(declare-fun mapKey!19906 () (_ BitVec 32))

(assert (=> mapNonEmpty!19906 (= (arr!13524 _values!549) (store mapRest!19906 mapKey!19906 mapValue!19906))))

(declare-fun b!454507 () Bool)

(declare-fun res!270820 () Bool)

(assert (=> b!454507 (=> (not res!270820) (not e!265909))))

(declare-datatypes ((List!8140 0))(
  ( (Nil!8137) (Cons!8136 (h!8992 (_ BitVec 64)) (t!13968 List!8140)) )
))
(declare-fun arrayNoDuplicates!0 (array!28159 (_ BitVec 32) List!8140) Bool)

(assert (=> b!454507 (= res!270820 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8137))))

(declare-fun b!454508 () Bool)

(declare-fun res!270823 () Bool)

(assert (=> b!454508 (=> (not res!270823) (not e!265905))))

(declare-fun lt!206150 () array!28159)

(assert (=> b!454508 (= res!270823 (arrayNoDuplicates!0 lt!206150 #b00000000000000000000000000000000 Nil!8137))))

(declare-fun b!454509 () Bool)

(assert (=> b!454509 (= e!265906 tp_is_empty!12177)))

(declare-fun b!454510 () Bool)

(assert (=> b!454510 (= e!265908 (and e!265904 mapRes!19906))))

(declare-fun condMapEmpty!19906 () Bool)

(declare-fun mapDefault!19906 () ValueCell!5745)

(assert (=> b!454510 (= condMapEmpty!19906 (= (arr!13524 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5745)) mapDefault!19906)))))

(declare-fun b!454511 () Bool)

(assert (=> b!454511 (= e!265909 e!265905)))

(declare-fun res!270822 () Bool)

(assert (=> b!454511 (=> (not res!270822) (not e!265905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28159 (_ BitVec 32)) Bool)

(assert (=> b!454511 (= res!270822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206150 mask!1025))))

(assert (=> b!454511 (= lt!206150 (array!28160 (store (arr!13523 _keys!709) i!563 k0!794) (size!13875 _keys!709)))))

(declare-fun b!454512 () Bool)

(declare-fun res!270816 () Bool)

(assert (=> b!454512 (=> (not res!270816) (not e!265909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454512 (= res!270816 (validKeyInArray!0 k0!794))))

(declare-fun b!454513 () Bool)

(declare-fun res!270817 () Bool)

(assert (=> b!454513 (=> (not res!270817) (not e!265909))))

(assert (=> b!454513 (= res!270817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454514 () Bool)

(declare-fun res!270818 () Bool)

(assert (=> b!454514 (=> (not res!270818) (not e!265909))))

(assert (=> b!454514 (= res!270818 (or (= (select (arr!13523 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13523 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454515 () Bool)

(assert (=> b!454515 (= e!265905 false)))

(declare-fun minValue!515 () V!17341)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8078 0))(
  ( (tuple2!8079 (_1!4050 (_ BitVec 64)) (_2!4050 V!17341)) )
))
(declare-datatypes ((List!8141 0))(
  ( (Nil!8138) (Cons!8137 (h!8993 tuple2!8078) (t!13969 List!8141)) )
))
(declare-datatypes ((ListLongMap!6991 0))(
  ( (ListLongMap!6992 (toList!3511 List!8141)) )
))
(declare-fun lt!206148 () ListLongMap!6991)

(declare-fun zeroValue!515 () V!17341)

(declare-fun v!412 () V!17341)

(declare-fun getCurrentListMapNoExtraKeys!1694 (array!28159 array!28161 (_ BitVec 32) (_ BitVec 32) V!17341 V!17341 (_ BitVec 32) Int) ListLongMap!6991)

(assert (=> b!454515 (= lt!206148 (getCurrentListMapNoExtraKeys!1694 lt!206150 (array!28162 (store (arr!13524 _values!549) i!563 (ValueCellFull!5745 v!412)) (size!13876 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206149 () ListLongMap!6991)

(assert (=> b!454515 (= lt!206149 (getCurrentListMapNoExtraKeys!1694 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454516 () Bool)

(declare-fun res!270821 () Bool)

(assert (=> b!454516 (=> (not res!270821) (not e!265909))))

(assert (=> b!454516 (= res!270821 (and (= (size!13876 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13875 _keys!709) (size!13876 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19906 () Bool)

(assert (=> mapIsEmpty!19906 mapRes!19906))

(assert (= (and start!40904 res!270819) b!454503))

(assert (= (and b!454503 res!270827) b!454516))

(assert (= (and b!454516 res!270821) b!454513))

(assert (= (and b!454513 res!270817) b!454507))

(assert (= (and b!454507 res!270820) b!454506))

(assert (= (and b!454506 res!270824) b!454512))

(assert (= (and b!454512 res!270816) b!454514))

(assert (= (and b!454514 res!270818) b!454505))

(assert (= (and b!454505 res!270825) b!454511))

(assert (= (and b!454511 res!270822) b!454508))

(assert (= (and b!454508 res!270823) b!454502))

(assert (= (and b!454502 res!270826) b!454515))

(assert (= (and b!454510 condMapEmpty!19906) mapIsEmpty!19906))

(assert (= (and b!454510 (not condMapEmpty!19906)) mapNonEmpty!19906))

(get-info :version)

(assert (= (and mapNonEmpty!19906 ((_ is ValueCellFull!5745) mapValue!19906)) b!454509))

(assert (= (and b!454510 ((_ is ValueCellFull!5745) mapDefault!19906)) b!454504))

(assert (= start!40904 b!454510))

(declare-fun m!438601 () Bool)

(assert (=> b!454511 m!438601))

(declare-fun m!438603 () Bool)

(assert (=> b!454511 m!438603))

(declare-fun m!438605 () Bool)

(assert (=> start!40904 m!438605))

(declare-fun m!438607 () Bool)

(assert (=> start!40904 m!438607))

(declare-fun m!438609 () Bool)

(assert (=> b!454508 m!438609))

(declare-fun m!438611 () Bool)

(assert (=> b!454505 m!438611))

(declare-fun m!438613 () Bool)

(assert (=> b!454514 m!438613))

(declare-fun m!438615 () Bool)

(assert (=> b!454503 m!438615))

(declare-fun m!438617 () Bool)

(assert (=> b!454512 m!438617))

(declare-fun m!438619 () Bool)

(assert (=> mapNonEmpty!19906 m!438619))

(declare-fun m!438621 () Bool)

(assert (=> b!454513 m!438621))

(declare-fun m!438623 () Bool)

(assert (=> b!454515 m!438623))

(declare-fun m!438625 () Bool)

(assert (=> b!454515 m!438625))

(declare-fun m!438627 () Bool)

(assert (=> b!454515 m!438627))

(declare-fun m!438629 () Bool)

(assert (=> b!454507 m!438629))

(check-sat (not b!454505) (not b!454508) (not start!40904) (not b!454507) (not b!454512) (not b_next!10839) (not b!454513) (not mapNonEmpty!19906) (not b!454503) b_and!18981 (not b!454515) (not b!454511) tp_is_empty!12177)
(check-sat b_and!18981 (not b_next!10839))
