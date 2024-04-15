; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41226 () Bool)

(assert start!41226)

(declare-fun b_free!11083 () Bool)

(declare-fun b_next!11083 () Bool)

(assert (=> start!41226 (= b_free!11083 (not b_next!11083))))

(declare-fun tp!39087 () Bool)

(declare-fun b_and!19377 () Bool)

(assert (=> start!41226 (= tp!39087 b_and!19377)))

(declare-fun b!461118 () Bool)

(declare-fun e!268920 () Bool)

(declare-fun e!268917 () Bool)

(declare-fun mapRes!20284 () Bool)

(assert (=> b!461118 (= e!268920 (and e!268917 mapRes!20284))))

(declare-fun condMapEmpty!20284 () Bool)

(declare-datatypes ((V!17667 0))(
  ( (V!17668 (val!6255 Int)) )
))
(declare-datatypes ((ValueCell!5867 0))(
  ( (ValueCellFull!5867 (v!8531 V!17667)) (EmptyCell!5867) )
))
(declare-datatypes ((array!28637 0))(
  ( (array!28638 (arr!13758 (Array (_ BitVec 32) ValueCell!5867)) (size!14111 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28637)

(declare-fun mapDefault!20284 () ValueCell!5867)

(assert (=> b!461118 (= condMapEmpty!20284 (= (arr!13758 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5867)) mapDefault!20284)))))

(declare-fun mapIsEmpty!20284 () Bool)

(assert (=> mapIsEmpty!20284 mapRes!20284))

(declare-fun b!461119 () Bool)

(declare-fun res!275856 () Bool)

(declare-fun e!268919 () Bool)

(assert (=> b!461119 (=> (not res!275856) (not e!268919))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461119 (= res!275856 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!20284 () Bool)

(declare-fun tp!39088 () Bool)

(declare-fun e!268922 () Bool)

(assert (=> mapNonEmpty!20284 (= mapRes!20284 (and tp!39088 e!268922))))

(declare-fun mapRest!20284 () (Array (_ BitVec 32) ValueCell!5867))

(declare-fun mapValue!20284 () ValueCell!5867)

(declare-fun mapKey!20284 () (_ BitVec 32))

(assert (=> mapNonEmpty!20284 (= (arr!13758 _values!549) (store mapRest!20284 mapKey!20284 mapValue!20284))))

(declare-fun b!461120 () Bool)

(declare-fun res!275852 () Bool)

(declare-fun e!268916 () Bool)

(assert (=> b!461120 (=> (not res!275852) (not e!268916))))

(declare-datatypes ((array!28639 0))(
  ( (array!28640 (arr!13759 (Array (_ BitVec 32) (_ BitVec 64))) (size!14112 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28639)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461120 (= res!275852 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!461121 () Bool)

(declare-fun e!268921 () Bool)

(assert (=> b!461121 (= e!268921 (not true))))

(declare-fun minValue!515 () V!17667)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17667)

(declare-fun lt!208740 () array!28637)

(declare-fun lt!208742 () array!28639)

(declare-fun v!412 () V!17667)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!8280 0))(
  ( (tuple2!8281 (_1!4151 (_ BitVec 64)) (_2!4151 V!17667)) )
))
(declare-datatypes ((List!8343 0))(
  ( (Nil!8340) (Cons!8339 (h!9195 tuple2!8280) (t!14276 List!8343)) )
))
(declare-datatypes ((ListLongMap!7183 0))(
  ( (ListLongMap!7184 (toList!3607 List!8343)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1799 (array!28639 array!28637 (_ BitVec 32) (_ BitVec 32) V!17667 V!17667 (_ BitVec 32) Int) ListLongMap!7183)

(declare-fun +!1659 (ListLongMap!7183 tuple2!8280) ListLongMap!7183)

(assert (=> b!461121 (= (getCurrentListMapNoExtraKeys!1799 lt!208742 lt!208740 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1659 (getCurrentListMapNoExtraKeys!1799 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8281 k0!794 v!412)))))

(declare-datatypes ((Unit!13398 0))(
  ( (Unit!13399) )
))
(declare-fun lt!208743 () Unit!13398)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!789 (array!28639 array!28637 (_ BitVec 32) (_ BitVec 32) V!17667 V!17667 (_ BitVec 32) (_ BitVec 64) V!17667 (_ BitVec 32) Int) Unit!13398)

(assert (=> b!461121 (= lt!208743 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!789 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461122 () Bool)

(declare-fun res!275858 () Bool)

(assert (=> b!461122 (=> (not res!275858) (not e!268916))))

(assert (=> b!461122 (= res!275858 (and (= (size!14111 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14112 _keys!709) (size!14111 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!461123 () Bool)

(declare-fun res!275854 () Bool)

(assert (=> b!461123 (=> (not res!275854) (not e!268919))))

(declare-datatypes ((List!8344 0))(
  ( (Nil!8341) (Cons!8340 (h!9196 (_ BitVec 64)) (t!14277 List!8344)) )
))
(declare-fun arrayNoDuplicates!0 (array!28639 (_ BitVec 32) List!8344) Bool)

(assert (=> b!461123 (= res!275854 (arrayNoDuplicates!0 lt!208742 #b00000000000000000000000000000000 Nil!8341))))

(declare-fun b!461124 () Bool)

(declare-fun res!275851 () Bool)

(assert (=> b!461124 (=> (not res!275851) (not e!268916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461124 (= res!275851 (validMask!0 mask!1025))))

(declare-fun b!461125 () Bool)

(assert (=> b!461125 (= e!268919 e!268921)))

(declare-fun res!275855 () Bool)

(assert (=> b!461125 (=> (not res!275855) (not e!268921))))

(assert (=> b!461125 (= res!275855 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!208739 () ListLongMap!7183)

(assert (=> b!461125 (= lt!208739 (getCurrentListMapNoExtraKeys!1799 lt!208742 lt!208740 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!461125 (= lt!208740 (array!28638 (store (arr!13758 _values!549) i!563 (ValueCellFull!5867 v!412)) (size!14111 _values!549)))))

(declare-fun lt!208741 () ListLongMap!7183)

(assert (=> b!461125 (= lt!208741 (getCurrentListMapNoExtraKeys!1799 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!275848 () Bool)

(assert (=> start!41226 (=> (not res!275848) (not e!268916))))

(assert (=> start!41226 (= res!275848 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14112 _keys!709))))))

(assert (=> start!41226 e!268916))

(declare-fun tp_is_empty!12421 () Bool)

(assert (=> start!41226 tp_is_empty!12421))

(assert (=> start!41226 tp!39087))

(assert (=> start!41226 true))

(declare-fun array_inv!10016 (array!28637) Bool)

(assert (=> start!41226 (and (array_inv!10016 _values!549) e!268920)))

(declare-fun array_inv!10017 (array!28639) Bool)

(assert (=> start!41226 (array_inv!10017 _keys!709)))

(declare-fun b!461126 () Bool)

(declare-fun res!275846 () Bool)

(assert (=> b!461126 (=> (not res!275846) (not e!268916))))

(assert (=> b!461126 (= res!275846 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8341))))

(declare-fun b!461127 () Bool)

(declare-fun res!275857 () Bool)

(assert (=> b!461127 (=> (not res!275857) (not e!268916))))

(assert (=> b!461127 (= res!275857 (or (= (select (arr!13759 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13759 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461128 () Bool)

(declare-fun res!275850 () Bool)

(assert (=> b!461128 (=> (not res!275850) (not e!268916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461128 (= res!275850 (validKeyInArray!0 k0!794))))

(declare-fun b!461129 () Bool)

(declare-fun res!275849 () Bool)

(assert (=> b!461129 (=> (not res!275849) (not e!268916))))

(assert (=> b!461129 (= res!275849 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14112 _keys!709))))))

(declare-fun b!461130 () Bool)

(assert (=> b!461130 (= e!268922 tp_is_empty!12421)))

(declare-fun b!461131 () Bool)

(assert (=> b!461131 (= e!268917 tp_is_empty!12421)))

(declare-fun b!461132 () Bool)

(declare-fun res!275853 () Bool)

(assert (=> b!461132 (=> (not res!275853) (not e!268916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28639 (_ BitVec 32)) Bool)

(assert (=> b!461132 (= res!275853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!461133 () Bool)

(assert (=> b!461133 (= e!268916 e!268919)))

(declare-fun res!275847 () Bool)

(assert (=> b!461133 (=> (not res!275847) (not e!268919))))

(assert (=> b!461133 (= res!275847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208742 mask!1025))))

(assert (=> b!461133 (= lt!208742 (array!28640 (store (arr!13759 _keys!709) i!563 k0!794) (size!14112 _keys!709)))))

(assert (= (and start!41226 res!275848) b!461124))

(assert (= (and b!461124 res!275851) b!461122))

(assert (= (and b!461122 res!275858) b!461132))

(assert (= (and b!461132 res!275853) b!461126))

(assert (= (and b!461126 res!275846) b!461129))

(assert (= (and b!461129 res!275849) b!461128))

(assert (= (and b!461128 res!275850) b!461127))

(assert (= (and b!461127 res!275857) b!461120))

(assert (= (and b!461120 res!275852) b!461133))

(assert (= (and b!461133 res!275847) b!461123))

(assert (= (and b!461123 res!275854) b!461119))

(assert (= (and b!461119 res!275856) b!461125))

(assert (= (and b!461125 res!275855) b!461121))

(assert (= (and b!461118 condMapEmpty!20284) mapIsEmpty!20284))

(assert (= (and b!461118 (not condMapEmpty!20284)) mapNonEmpty!20284))

(get-info :version)

(assert (= (and mapNonEmpty!20284 ((_ is ValueCellFull!5867) mapValue!20284)) b!461130))

(assert (= (and b!461118 ((_ is ValueCellFull!5867) mapDefault!20284)) b!461131))

(assert (= start!41226 b!461118))

(declare-fun m!443821 () Bool)

(assert (=> mapNonEmpty!20284 m!443821))

(declare-fun m!443823 () Bool)

(assert (=> b!461128 m!443823))

(declare-fun m!443825 () Bool)

(assert (=> b!461133 m!443825))

(declare-fun m!443827 () Bool)

(assert (=> b!461133 m!443827))

(declare-fun m!443829 () Bool)

(assert (=> b!461120 m!443829))

(declare-fun m!443831 () Bool)

(assert (=> b!461125 m!443831))

(declare-fun m!443833 () Bool)

(assert (=> b!461125 m!443833))

(declare-fun m!443835 () Bool)

(assert (=> b!461125 m!443835))

(declare-fun m!443837 () Bool)

(assert (=> b!461132 m!443837))

(declare-fun m!443839 () Bool)

(assert (=> b!461127 m!443839))

(declare-fun m!443841 () Bool)

(assert (=> b!461123 m!443841))

(declare-fun m!443843 () Bool)

(assert (=> b!461121 m!443843))

(declare-fun m!443845 () Bool)

(assert (=> b!461121 m!443845))

(assert (=> b!461121 m!443845))

(declare-fun m!443847 () Bool)

(assert (=> b!461121 m!443847))

(declare-fun m!443849 () Bool)

(assert (=> b!461121 m!443849))

(declare-fun m!443851 () Bool)

(assert (=> start!41226 m!443851))

(declare-fun m!443853 () Bool)

(assert (=> start!41226 m!443853))

(declare-fun m!443855 () Bool)

(assert (=> b!461124 m!443855))

(declare-fun m!443857 () Bool)

(assert (=> b!461126 m!443857))

(check-sat tp_is_empty!12421 (not b!461125) (not b_next!11083) (not b!461121) (not b!461128) (not b!461126) (not b!461133) (not b!461124) b_and!19377 (not b!461132) (not start!41226) (not b!461120) (not b!461123) (not mapNonEmpty!20284))
(check-sat b_and!19377 (not b_next!11083))
