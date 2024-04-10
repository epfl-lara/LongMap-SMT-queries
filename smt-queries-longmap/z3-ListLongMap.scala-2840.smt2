; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41006 () Bool)

(assert start!41006)

(declare-fun b_free!10941 () Bool)

(declare-fun b_next!10941 () Bool)

(assert (=> start!41006 (= b_free!10941 (not b_next!10941))))

(declare-fun tp!38650 () Bool)

(declare-fun b_and!19083 () Bool)

(assert (=> start!41006 (= tp!38650 b_and!19083)))

(declare-fun b!456843 () Bool)

(declare-fun e!266872 () Bool)

(declare-fun tp_is_empty!12279 () Bool)

(assert (=> b!456843 (= e!266872 tp_is_empty!12279)))

(declare-fun mapNonEmpty!20059 () Bool)

(declare-fun mapRes!20059 () Bool)

(declare-fun tp!38649 () Bool)

(declare-fun e!266871 () Bool)

(assert (=> mapNonEmpty!20059 (= mapRes!20059 (and tp!38649 e!266871))))

(declare-datatypes ((V!17477 0))(
  ( (V!17478 (val!6184 Int)) )
))
(declare-datatypes ((ValueCell!5796 0))(
  ( (ValueCellFull!5796 (v!8450 V!17477)) (EmptyCell!5796) )
))
(declare-fun mapValue!20059 () ValueCell!5796)

(declare-datatypes ((array!28359 0))(
  ( (array!28360 (arr!13623 (Array (_ BitVec 32) ValueCell!5796)) (size!13975 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28359)

(declare-fun mapKey!20059 () (_ BitVec 32))

(declare-fun mapRest!20059 () (Array (_ BitVec 32) ValueCell!5796))

(assert (=> mapNonEmpty!20059 (= (arr!13623 _values!549) (store mapRest!20059 mapKey!20059 mapValue!20059))))

(declare-fun b!456844 () Bool)

(declare-fun e!266869 () Bool)

(declare-fun e!266875 () Bool)

(assert (=> b!456844 (= e!266869 (not e!266875))))

(declare-fun res!272710 () Bool)

(assert (=> b!456844 (=> res!272710 e!266875)))

(declare-datatypes ((array!28361 0))(
  ( (array!28362 (arr!13624 (Array (_ BitVec 32) (_ BitVec 64))) (size!13976 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28361)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456844 (= res!272710 (not (validKeyInArray!0 (select (arr!13624 _keys!709) from!863))))))

(declare-fun minValue!515 () V!17477)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17477)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!206674 () array!28359)

(declare-fun v!412 () V!17477)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!206672 () array!28361)

(declare-datatypes ((tuple2!8146 0))(
  ( (tuple2!8147 (_1!4084 (_ BitVec 64)) (_2!4084 V!17477)) )
))
(declare-datatypes ((List!8219 0))(
  ( (Nil!8216) (Cons!8215 (h!9071 tuple2!8146) (t!14047 List!8219)) )
))
(declare-datatypes ((ListLongMap!7059 0))(
  ( (ListLongMap!7060 (toList!3545 List!8219)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1728 (array!28361 array!28359 (_ BitVec 32) (_ BitVec 32) V!17477 V!17477 (_ BitVec 32) Int) ListLongMap!7059)

(declare-fun +!1581 (ListLongMap!7059 tuple2!8146) ListLongMap!7059)

(assert (=> b!456844 (= (getCurrentListMapNoExtraKeys!1728 lt!206672 lt!206674 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1581 (getCurrentListMapNoExtraKeys!1728 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8147 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13284 0))(
  ( (Unit!13285) )
))
(declare-fun lt!206675 () Unit!13284)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!741 (array!28361 array!28359 (_ BitVec 32) (_ BitVec 32) V!17477 V!17477 (_ BitVec 32) (_ BitVec 64) V!17477 (_ BitVec 32) Int) Unit!13284)

(assert (=> b!456844 (= lt!206675 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!741 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!456845 () Bool)

(declare-fun res!272703 () Bool)

(declare-fun e!266874 () Bool)

(assert (=> b!456845 (=> (not res!272703) (not e!266874))))

(assert (=> b!456845 (= res!272703 (or (= (select (arr!13624 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13624 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456846 () Bool)

(declare-fun e!266873 () Bool)

(assert (=> b!456846 (= e!266874 e!266873)))

(declare-fun res!272698 () Bool)

(assert (=> b!456846 (=> (not res!272698) (not e!266873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28361 (_ BitVec 32)) Bool)

(assert (=> b!456846 (= res!272698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206672 mask!1025))))

(assert (=> b!456846 (= lt!206672 (array!28362 (store (arr!13624 _keys!709) i!563 k0!794) (size!13976 _keys!709)))))

(declare-fun mapIsEmpty!20059 () Bool)

(assert (=> mapIsEmpty!20059 mapRes!20059))

(declare-fun b!456847 () Bool)

(declare-fun res!272706 () Bool)

(assert (=> b!456847 (=> (not res!272706) (not e!266874))))

(assert (=> b!456847 (= res!272706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!272704 () Bool)

(assert (=> start!41006 (=> (not res!272704) (not e!266874))))

(assert (=> start!41006 (= res!272704 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13976 _keys!709))))))

(assert (=> start!41006 e!266874))

(assert (=> start!41006 tp_is_empty!12279))

(assert (=> start!41006 tp!38650))

(assert (=> start!41006 true))

(declare-fun e!266870 () Bool)

(declare-fun array_inv!9866 (array!28359) Bool)

(assert (=> start!41006 (and (array_inv!9866 _values!549) e!266870)))

(declare-fun array_inv!9867 (array!28361) Bool)

(assert (=> start!41006 (array_inv!9867 _keys!709)))

(declare-fun b!456848 () Bool)

(declare-fun res!272700 () Bool)

(assert (=> b!456848 (=> (not res!272700) (not e!266873))))

(declare-datatypes ((List!8220 0))(
  ( (Nil!8217) (Cons!8216 (h!9072 (_ BitVec 64)) (t!14048 List!8220)) )
))
(declare-fun arrayNoDuplicates!0 (array!28361 (_ BitVec 32) List!8220) Bool)

(assert (=> b!456848 (= res!272700 (arrayNoDuplicates!0 lt!206672 #b00000000000000000000000000000000 Nil!8217))))

(declare-fun b!456849 () Bool)

(assert (=> b!456849 (= e!266873 e!266869)))

(declare-fun res!272711 () Bool)

(assert (=> b!456849 (=> (not res!272711) (not e!266869))))

(assert (=> b!456849 (= res!272711 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206673 () ListLongMap!7059)

(assert (=> b!456849 (= lt!206673 (getCurrentListMapNoExtraKeys!1728 lt!206672 lt!206674 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!456849 (= lt!206674 (array!28360 (store (arr!13623 _values!549) i!563 (ValueCellFull!5796 v!412)) (size!13975 _values!549)))))

(declare-fun lt!206671 () ListLongMap!7059)

(assert (=> b!456849 (= lt!206671 (getCurrentListMapNoExtraKeys!1728 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456850 () Bool)

(assert (=> b!456850 (= e!266875 (bvslt from!863 (size!13976 _keys!709)))))

(declare-fun b!456851 () Bool)

(declare-fun res!272705 () Bool)

(assert (=> b!456851 (=> (not res!272705) (not e!266874))))

(assert (=> b!456851 (= res!272705 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8217))))

(declare-fun b!456852 () Bool)

(declare-fun res!272699 () Bool)

(assert (=> b!456852 (=> (not res!272699) (not e!266873))))

(assert (=> b!456852 (= res!272699 (bvsle from!863 i!563))))

(declare-fun b!456853 () Bool)

(declare-fun res!272702 () Bool)

(assert (=> b!456853 (=> (not res!272702) (not e!266874))))

(declare-fun arrayContainsKey!0 (array!28361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456853 (= res!272702 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456854 () Bool)

(declare-fun res!272707 () Bool)

(assert (=> b!456854 (=> (not res!272707) (not e!266874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456854 (= res!272707 (validMask!0 mask!1025))))

(declare-fun b!456855 () Bool)

(declare-fun res!272708 () Bool)

(assert (=> b!456855 (=> (not res!272708) (not e!266874))))

(assert (=> b!456855 (= res!272708 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13976 _keys!709))))))

(declare-fun b!456856 () Bool)

(assert (=> b!456856 (= e!266870 (and e!266872 mapRes!20059))))

(declare-fun condMapEmpty!20059 () Bool)

(declare-fun mapDefault!20059 () ValueCell!5796)

(assert (=> b!456856 (= condMapEmpty!20059 (= (arr!13623 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5796)) mapDefault!20059)))))

(declare-fun b!456857 () Bool)

(declare-fun res!272701 () Bool)

(assert (=> b!456857 (=> (not res!272701) (not e!266874))))

(assert (=> b!456857 (= res!272701 (validKeyInArray!0 k0!794))))

(declare-fun b!456858 () Bool)

(declare-fun res!272709 () Bool)

(assert (=> b!456858 (=> (not res!272709) (not e!266874))))

(assert (=> b!456858 (= res!272709 (and (= (size!13975 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13976 _keys!709) (size!13975 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456859 () Bool)

(assert (=> b!456859 (= e!266871 tp_is_empty!12279)))

(assert (= (and start!41006 res!272704) b!456854))

(assert (= (and b!456854 res!272707) b!456858))

(assert (= (and b!456858 res!272709) b!456847))

(assert (= (and b!456847 res!272706) b!456851))

(assert (= (and b!456851 res!272705) b!456855))

(assert (= (and b!456855 res!272708) b!456857))

(assert (= (and b!456857 res!272701) b!456845))

(assert (= (and b!456845 res!272703) b!456853))

(assert (= (and b!456853 res!272702) b!456846))

(assert (= (and b!456846 res!272698) b!456848))

(assert (= (and b!456848 res!272700) b!456852))

(assert (= (and b!456852 res!272699) b!456849))

(assert (= (and b!456849 res!272711) b!456844))

(assert (= (and b!456844 (not res!272710)) b!456850))

(assert (= (and b!456856 condMapEmpty!20059) mapIsEmpty!20059))

(assert (= (and b!456856 (not condMapEmpty!20059)) mapNonEmpty!20059))

(get-info :version)

(assert (= (and mapNonEmpty!20059 ((_ is ValueCellFull!5796) mapValue!20059)) b!456859))

(assert (= (and b!456856 ((_ is ValueCellFull!5796) mapDefault!20059)) b!456843))

(assert (= start!41006 b!456856))

(declare-fun m!440227 () Bool)

(assert (=> b!456845 m!440227))

(declare-fun m!440229 () Bool)

(assert (=> b!456853 m!440229))

(declare-fun m!440231 () Bool)

(assert (=> start!41006 m!440231))

(declare-fun m!440233 () Bool)

(assert (=> start!41006 m!440233))

(declare-fun m!440235 () Bool)

(assert (=> b!456848 m!440235))

(declare-fun m!440237 () Bool)

(assert (=> b!456847 m!440237))

(declare-fun m!440239 () Bool)

(assert (=> b!456857 m!440239))

(declare-fun m!440241 () Bool)

(assert (=> b!456854 m!440241))

(declare-fun m!440243 () Bool)

(assert (=> b!456846 m!440243))

(declare-fun m!440245 () Bool)

(assert (=> b!456846 m!440245))

(declare-fun m!440247 () Bool)

(assert (=> b!456844 m!440247))

(declare-fun m!440249 () Bool)

(assert (=> b!456844 m!440249))

(assert (=> b!456844 m!440247))

(declare-fun m!440251 () Bool)

(assert (=> b!456844 m!440251))

(declare-fun m!440253 () Bool)

(assert (=> b!456844 m!440253))

(assert (=> b!456844 m!440249))

(declare-fun m!440255 () Bool)

(assert (=> b!456844 m!440255))

(declare-fun m!440257 () Bool)

(assert (=> b!456844 m!440257))

(declare-fun m!440259 () Bool)

(assert (=> b!456851 m!440259))

(declare-fun m!440261 () Bool)

(assert (=> mapNonEmpty!20059 m!440261))

(declare-fun m!440263 () Bool)

(assert (=> b!456849 m!440263))

(declare-fun m!440265 () Bool)

(assert (=> b!456849 m!440265))

(declare-fun m!440267 () Bool)

(assert (=> b!456849 m!440267))

(check-sat (not b!456851) (not b!456849) (not mapNonEmpty!20059) (not b!456847) (not b!456854) (not b!456846) (not b!456857) (not start!41006) (not b!456848) tp_is_empty!12279 (not b_next!10941) (not b!456853) (not b!456844) b_and!19083)
(check-sat b_and!19083 (not b_next!10941))
