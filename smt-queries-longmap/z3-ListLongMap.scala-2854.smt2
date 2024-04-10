; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41156 () Bool)

(assert start!41156)

(declare-fun b_free!11025 () Bool)

(declare-fun b_next!11025 () Bool)

(assert (=> start!41156 (= b_free!11025 (not b_next!11025))))

(declare-fun tp!38910 () Bool)

(declare-fun b_and!19289 () Bool)

(assert (=> start!41156 (= tp!38910 b_and!19289)))

(declare-fun b!459578 () Bool)

(declare-fun res!274674 () Bool)

(declare-fun e!268213 () Bool)

(assert (=> b!459578 (=> (not res!274674) (not e!268213))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459578 (= res!274674 (validKeyInArray!0 k0!794))))

(declare-fun b!459579 () Bool)

(declare-datatypes ((Unit!13358 0))(
  ( (Unit!13359) )
))
(declare-fun e!268219 () Unit!13358)

(declare-fun Unit!13360 () Unit!13358)

(assert (=> b!459579 (= e!268219 Unit!13360)))

(declare-fun b!459580 () Bool)

(declare-fun e!268214 () Bool)

(declare-fun tp_is_empty!12363 () Bool)

(assert (=> b!459580 (= e!268214 tp_is_empty!12363)))

(declare-fun b!459581 () Bool)

(declare-fun e!268218 () Bool)

(declare-fun e!268217 () Bool)

(assert (=> b!459581 (= e!268218 (not e!268217))))

(declare-fun res!274676 () Bool)

(assert (=> b!459581 (=> res!274676 e!268217)))

(declare-datatypes ((array!28527 0))(
  ( (array!28528 (arr!13704 (Array (_ BitVec 32) (_ BitVec 64))) (size!14056 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28527)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!459581 (= res!274676 (not (validKeyInArray!0 (select (arr!13704 _keys!709) from!863))))))

(declare-datatypes ((V!17589 0))(
  ( (V!17590 (val!6226 Int)) )
))
(declare-datatypes ((tuple2!8210 0))(
  ( (tuple2!8211 (_1!4116 (_ BitVec 64)) (_2!4116 V!17589)) )
))
(declare-datatypes ((List!8281 0))(
  ( (Nil!8278) (Cons!8277 (h!9133 tuple2!8210) (t!14185 List!8281)) )
))
(declare-datatypes ((ListLongMap!7123 0))(
  ( (ListLongMap!7124 (toList!3577 List!8281)) )
))
(declare-fun lt!207941 () ListLongMap!7123)

(declare-fun lt!207934 () ListLongMap!7123)

(assert (=> b!459581 (= lt!207941 lt!207934)))

(declare-fun lt!207932 () ListLongMap!7123)

(declare-fun v!412 () V!17589)

(declare-fun +!1613 (ListLongMap!7123 tuple2!8210) ListLongMap!7123)

(assert (=> b!459581 (= lt!207934 (+!1613 lt!207932 (tuple2!8211 k0!794 v!412)))))

(declare-fun minValue!515 () V!17589)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17589)

(declare-fun lt!207940 () array!28527)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5838 0))(
  ( (ValueCellFull!5838 (v!8504 V!17589)) (EmptyCell!5838) )
))
(declare-datatypes ((array!28529 0))(
  ( (array!28530 (arr!13705 (Array (_ BitVec 32) ValueCell!5838)) (size!14057 (_ BitVec 32))) )
))
(declare-fun lt!207938 () array!28529)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1757 (array!28527 array!28529 (_ BitVec 32) (_ BitVec 32) V!17589 V!17589 (_ BitVec 32) Int) ListLongMap!7123)

(assert (=> b!459581 (= lt!207941 (getCurrentListMapNoExtraKeys!1757 lt!207940 lt!207938 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28529)

(assert (=> b!459581 (= lt!207932 (getCurrentListMapNoExtraKeys!1757 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!207936 () Unit!13358)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!769 (array!28527 array!28529 (_ BitVec 32) (_ BitVec 32) V!17589 V!17589 (_ BitVec 32) (_ BitVec 64) V!17589 (_ BitVec 32) Int) Unit!13358)

(assert (=> b!459581 (= lt!207936 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!769 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459582 () Bool)

(declare-fun res!274665 () Bool)

(assert (=> b!459582 (=> (not res!274665) (not e!268213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28527 (_ BitVec 32)) Bool)

(assert (=> b!459582 (= res!274665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459584 () Bool)

(declare-fun res!274675 () Bool)

(declare-fun e!268221 () Bool)

(assert (=> b!459584 (=> (not res!274675) (not e!268221))))

(assert (=> b!459584 (= res!274675 (bvsle from!863 i!563))))

(declare-fun b!459585 () Bool)

(declare-fun Unit!13361 () Unit!13358)

(assert (=> b!459585 (= e!268219 Unit!13361)))

(declare-fun lt!207935 () Unit!13358)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28527 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13358)

(assert (=> b!459585 (= lt!207935 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459585 false))

(declare-fun b!459586 () Bool)

(assert (=> b!459586 (= e!268221 e!268218)))

(declare-fun res!274677 () Bool)

(assert (=> b!459586 (=> (not res!274677) (not e!268218))))

(assert (=> b!459586 (= res!274677 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207939 () ListLongMap!7123)

(assert (=> b!459586 (= lt!207939 (getCurrentListMapNoExtraKeys!1757 lt!207940 lt!207938 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!459586 (= lt!207938 (array!28530 (store (arr!13705 _values!549) i!563 (ValueCellFull!5838 v!412)) (size!14057 _values!549)))))

(declare-fun lt!207933 () ListLongMap!7123)

(assert (=> b!459586 (= lt!207933 (getCurrentListMapNoExtraKeys!1757 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!20194 () Bool)

(declare-fun mapRes!20194 () Bool)

(assert (=> mapIsEmpty!20194 mapRes!20194))

(declare-fun b!459587 () Bool)

(declare-fun e!268216 () Bool)

(assert (=> b!459587 (= e!268216 tp_is_empty!12363)))

(declare-fun b!459588 () Bool)

(assert (=> b!459588 (= e!268213 e!268221)))

(declare-fun res!274670 () Bool)

(assert (=> b!459588 (=> (not res!274670) (not e!268221))))

(assert (=> b!459588 (= res!274670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207940 mask!1025))))

(assert (=> b!459588 (= lt!207940 (array!28528 (store (arr!13704 _keys!709) i!563 k0!794) (size!14056 _keys!709)))))

(declare-fun b!459589 () Bool)

(declare-fun res!274669 () Bool)

(assert (=> b!459589 (=> (not res!274669) (not e!268213))))

(declare-fun arrayContainsKey!0 (array!28527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459589 (= res!274669 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!459590 () Bool)

(declare-fun res!274668 () Bool)

(assert (=> b!459590 (=> (not res!274668) (not e!268213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459590 (= res!274668 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!20194 () Bool)

(declare-fun tp!38911 () Bool)

(assert (=> mapNonEmpty!20194 (= mapRes!20194 (and tp!38911 e!268214))))

(declare-fun mapRest!20194 () (Array (_ BitVec 32) ValueCell!5838))

(declare-fun mapKey!20194 () (_ BitVec 32))

(declare-fun mapValue!20194 () ValueCell!5838)

(assert (=> mapNonEmpty!20194 (= (arr!13705 _values!549) (store mapRest!20194 mapKey!20194 mapValue!20194))))

(declare-fun b!459591 () Bool)

(declare-fun res!274666 () Bool)

(assert (=> b!459591 (=> (not res!274666) (not e!268213))))

(assert (=> b!459591 (= res!274666 (or (= (select (arr!13704 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13704 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459592 () Bool)

(declare-fun e!268215 () Bool)

(assert (=> b!459592 (= e!268215 (and e!268216 mapRes!20194))))

(declare-fun condMapEmpty!20194 () Bool)

(declare-fun mapDefault!20194 () ValueCell!5838)

(assert (=> b!459592 (= condMapEmpty!20194 (= (arr!13705 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5838)) mapDefault!20194)))))

(declare-fun b!459593 () Bool)

(declare-fun res!274678 () Bool)

(assert (=> b!459593 (=> (not res!274678) (not e!268213))))

(assert (=> b!459593 (= res!274678 (and (= (size!14057 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14056 _keys!709) (size!14057 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459594 () Bool)

(declare-fun res!274667 () Bool)

(assert (=> b!459594 (=> (not res!274667) (not e!268221))))

(declare-datatypes ((List!8282 0))(
  ( (Nil!8279) (Cons!8278 (h!9134 (_ BitVec 64)) (t!14186 List!8282)) )
))
(declare-fun arrayNoDuplicates!0 (array!28527 (_ BitVec 32) List!8282) Bool)

(assert (=> b!459594 (= res!274667 (arrayNoDuplicates!0 lt!207940 #b00000000000000000000000000000000 Nil!8279))))

(declare-fun b!459583 () Bool)

(assert (=> b!459583 (= e!268217 (bvslt from!863 (size!14057 _values!549)))))

(assert (=> b!459583 (not (= (select (arr!13704 _keys!709) from!863) k0!794))))

(declare-fun lt!207937 () Unit!13358)

(assert (=> b!459583 (= lt!207937 e!268219)))

(declare-fun c!56486 () Bool)

(assert (=> b!459583 (= c!56486 (= (select (arr!13704 _keys!709) from!863) k0!794))))

(declare-fun get!6761 (ValueCell!5838 V!17589) V!17589)

(declare-fun dynLambda!899 (Int (_ BitVec 64)) V!17589)

(assert (=> b!459583 (= lt!207939 (+!1613 lt!207934 (tuple2!8211 (select (arr!13704 _keys!709) from!863) (get!6761 (select (arr!13705 _values!549) from!863) (dynLambda!899 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!274671 () Bool)

(assert (=> start!41156 (=> (not res!274671) (not e!268213))))

(assert (=> start!41156 (= res!274671 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14056 _keys!709))))))

(assert (=> start!41156 e!268213))

(assert (=> start!41156 tp_is_empty!12363))

(assert (=> start!41156 tp!38910))

(assert (=> start!41156 true))

(declare-fun array_inv!9910 (array!28529) Bool)

(assert (=> start!41156 (and (array_inv!9910 _values!549) e!268215)))

(declare-fun array_inv!9911 (array!28527) Bool)

(assert (=> start!41156 (array_inv!9911 _keys!709)))

(declare-fun b!459595 () Bool)

(declare-fun res!274672 () Bool)

(assert (=> b!459595 (=> (not res!274672) (not e!268213))))

(assert (=> b!459595 (= res!274672 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14056 _keys!709))))))

(declare-fun b!459596 () Bool)

(declare-fun res!274673 () Bool)

(assert (=> b!459596 (=> (not res!274673) (not e!268213))))

(assert (=> b!459596 (= res!274673 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8279))))

(assert (= (and start!41156 res!274671) b!459590))

(assert (= (and b!459590 res!274668) b!459593))

(assert (= (and b!459593 res!274678) b!459582))

(assert (= (and b!459582 res!274665) b!459596))

(assert (= (and b!459596 res!274673) b!459595))

(assert (= (and b!459595 res!274672) b!459578))

(assert (= (and b!459578 res!274674) b!459591))

(assert (= (and b!459591 res!274666) b!459589))

(assert (= (and b!459589 res!274669) b!459588))

(assert (= (and b!459588 res!274670) b!459594))

(assert (= (and b!459594 res!274667) b!459584))

(assert (= (and b!459584 res!274675) b!459586))

(assert (= (and b!459586 res!274677) b!459581))

(assert (= (and b!459581 (not res!274676)) b!459583))

(assert (= (and b!459583 c!56486) b!459585))

(assert (= (and b!459583 (not c!56486)) b!459579))

(assert (= (and b!459592 condMapEmpty!20194) mapIsEmpty!20194))

(assert (= (and b!459592 (not condMapEmpty!20194)) mapNonEmpty!20194))

(get-info :version)

(assert (= (and mapNonEmpty!20194 ((_ is ValueCellFull!5838) mapValue!20194)) b!459580))

(assert (= (and b!459592 ((_ is ValueCellFull!5838) mapDefault!20194)) b!459587))

(assert (= start!41156 b!459592))

(declare-fun b_lambda!9859 () Bool)

(assert (=> (not b_lambda!9859) (not b!459583)))

(declare-fun t!14184 () Bool)

(declare-fun tb!3861 () Bool)

(assert (=> (and start!41156 (= defaultEntry!557 defaultEntry!557) t!14184) tb!3861))

(declare-fun result!7267 () Bool)

(assert (=> tb!3861 (= result!7267 tp_is_empty!12363)))

(assert (=> b!459583 t!14184))

(declare-fun b_and!19291 () Bool)

(assert (= b_and!19289 (and (=> t!14184 result!7267) b_and!19291)))

(declare-fun m!442843 () Bool)

(assert (=> b!459590 m!442843))

(declare-fun m!442845 () Bool)

(assert (=> b!459578 m!442845))

(declare-fun m!442847 () Bool)

(assert (=> b!459585 m!442847))

(declare-fun m!442849 () Bool)

(assert (=> b!459582 m!442849))

(declare-fun m!442851 () Bool)

(assert (=> b!459583 m!442851))

(declare-fun m!442853 () Bool)

(assert (=> b!459583 m!442853))

(declare-fun m!442855 () Bool)

(assert (=> b!459583 m!442855))

(declare-fun m!442857 () Bool)

(assert (=> b!459583 m!442857))

(assert (=> b!459583 m!442857))

(assert (=> b!459583 m!442855))

(declare-fun m!442859 () Bool)

(assert (=> b!459583 m!442859))

(declare-fun m!442861 () Bool)

(assert (=> b!459586 m!442861))

(declare-fun m!442863 () Bool)

(assert (=> b!459586 m!442863))

(declare-fun m!442865 () Bool)

(assert (=> b!459586 m!442865))

(declare-fun m!442867 () Bool)

(assert (=> start!41156 m!442867))

(declare-fun m!442869 () Bool)

(assert (=> start!41156 m!442869))

(declare-fun m!442871 () Bool)

(assert (=> b!459594 m!442871))

(assert (=> b!459581 m!442851))

(declare-fun m!442873 () Bool)

(assert (=> b!459581 m!442873))

(declare-fun m!442875 () Bool)

(assert (=> b!459581 m!442875))

(declare-fun m!442877 () Bool)

(assert (=> b!459581 m!442877))

(assert (=> b!459581 m!442851))

(declare-fun m!442879 () Bool)

(assert (=> b!459581 m!442879))

(declare-fun m!442881 () Bool)

(assert (=> b!459581 m!442881))

(declare-fun m!442883 () Bool)

(assert (=> b!459596 m!442883))

(declare-fun m!442885 () Bool)

(assert (=> b!459588 m!442885))

(declare-fun m!442887 () Bool)

(assert (=> b!459588 m!442887))

(declare-fun m!442889 () Bool)

(assert (=> b!459591 m!442889))

(declare-fun m!442891 () Bool)

(assert (=> b!459589 m!442891))

(declare-fun m!442893 () Bool)

(assert (=> mapNonEmpty!20194 m!442893))

(check-sat (not b_next!11025) b_and!19291 (not b!459596) (not b_lambda!9859) (not b!459585) (not b!459578) (not start!41156) (not b!459581) (not b!459594) (not b!459590) (not b!459586) (not b!459588) (not b!459589) tp_is_empty!12363 (not mapNonEmpty!20194) (not b!459582) (not b!459583))
(check-sat b_and!19291 (not b_next!11025))
