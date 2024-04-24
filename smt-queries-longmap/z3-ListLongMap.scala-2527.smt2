; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38966 () Bool)

(assert start!38966)

(declare-fun mapNonEmpty!17220 () Bool)

(declare-fun mapRes!17220 () Bool)

(declare-fun tp!33339 () Bool)

(declare-fun e!245068 () Bool)

(assert (=> mapNonEmpty!17220 (= mapRes!17220 (and tp!33339 e!245068))))

(declare-fun mapKey!17220 () (_ BitVec 32))

(declare-datatypes ((V!14971 0))(
  ( (V!14972 (val!5244 Int)) )
))
(declare-datatypes ((ValueCell!4856 0))(
  ( (ValueCellFull!4856 (v!7492 V!14971)) (EmptyCell!4856) )
))
(declare-fun mapRest!17220 () (Array (_ BitVec 32) ValueCell!4856))

(declare-datatypes ((array!24672 0))(
  ( (array!24673 (arr!11785 (Array (_ BitVec 32) ValueCell!4856)) (size!12137 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24672)

(declare-fun mapValue!17220 () ValueCell!4856)

(assert (=> mapNonEmpty!17220 (= (arr!11785 _values!549) (store mapRest!17220 mapKey!17220 mapValue!17220))))

(declare-fun b!408253 () Bool)

(declare-fun e!245067 () Bool)

(declare-fun e!245065 () Bool)

(assert (=> b!408253 (= e!245067 e!245065)))

(declare-fun res!236211 () Bool)

(assert (=> b!408253 (=> (not res!236211) (not e!245065))))

(declare-datatypes ((array!24674 0))(
  ( (array!24675 (arr!11786 (Array (_ BitVec 32) (_ BitVec 64))) (size!12138 (_ BitVec 32))) )
))
(declare-fun lt!188795 () array!24674)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24674 (_ BitVec 32)) Bool)

(assert (=> b!408253 (= res!236211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188795 mask!1025))))

(declare-fun _keys!709 () array!24674)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408253 (= lt!188795 (array!24675 (store (arr!11786 _keys!709) i!563 k0!794) (size!12138 _keys!709)))))

(declare-fun b!408255 () Bool)

(declare-fun res!236214 () Bool)

(assert (=> b!408255 (=> (not res!236214) (not e!245067))))

(assert (=> b!408255 (= res!236214 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12138 _keys!709))))))

(declare-fun b!408256 () Bool)

(declare-fun res!236212 () Bool)

(assert (=> b!408256 (=> (not res!236212) (not e!245067))))

(declare-fun arrayContainsKey!0 (array!24674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408256 (= res!236212 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408257 () Bool)

(declare-fun res!236205 () Bool)

(assert (=> b!408257 (=> (not res!236205) (not e!245067))))

(declare-datatypes ((List!6708 0))(
  ( (Nil!6705) (Cons!6704 (h!7560 (_ BitVec 64)) (t!11874 List!6708)) )
))
(declare-fun arrayNoDuplicates!0 (array!24674 (_ BitVec 32) List!6708) Bool)

(assert (=> b!408257 (= res!236205 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6705))))

(declare-fun b!408258 () Bool)

(assert (=> b!408258 (= e!245065 false)))

(declare-fun lt!188796 () Bool)

(assert (=> b!408258 (= lt!188796 (arrayNoDuplicates!0 lt!188795 #b00000000000000000000000000000000 Nil!6705))))

(declare-fun b!408259 () Bool)

(declare-fun tp_is_empty!10399 () Bool)

(assert (=> b!408259 (= e!245068 tp_is_empty!10399)))

(declare-fun b!408260 () Bool)

(declare-fun res!236209 () Bool)

(assert (=> b!408260 (=> (not res!236209) (not e!245067))))

(assert (=> b!408260 (= res!236209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408261 () Bool)

(declare-fun e!245066 () Bool)

(declare-fun e!245063 () Bool)

(assert (=> b!408261 (= e!245066 (and e!245063 mapRes!17220))))

(declare-fun condMapEmpty!17220 () Bool)

(declare-fun mapDefault!17220 () ValueCell!4856)

(assert (=> b!408261 (= condMapEmpty!17220 (= (arr!11785 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4856)) mapDefault!17220)))))

(declare-fun b!408262 () Bool)

(declare-fun res!236206 () Bool)

(assert (=> b!408262 (=> (not res!236206) (not e!245067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408262 (= res!236206 (validMask!0 mask!1025))))

(declare-fun b!408254 () Bool)

(declare-fun res!236213 () Bool)

(assert (=> b!408254 (=> (not res!236213) (not e!245067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408254 (= res!236213 (validKeyInArray!0 k0!794))))

(declare-fun res!236207 () Bool)

(assert (=> start!38966 (=> (not res!236207) (not e!245067))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38966 (= res!236207 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12138 _keys!709))))))

(assert (=> start!38966 e!245067))

(assert (=> start!38966 true))

(declare-fun array_inv!8688 (array!24672) Bool)

(assert (=> start!38966 (and (array_inv!8688 _values!549) e!245066)))

(declare-fun array_inv!8689 (array!24674) Bool)

(assert (=> start!38966 (array_inv!8689 _keys!709)))

(declare-fun b!408263 () Bool)

(declare-fun res!236210 () Bool)

(assert (=> b!408263 (=> (not res!236210) (not e!245067))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408263 (= res!236210 (and (= (size!12137 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12138 _keys!709) (size!12137 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408264 () Bool)

(assert (=> b!408264 (= e!245063 tp_is_empty!10399)))

(declare-fun mapIsEmpty!17220 () Bool)

(assert (=> mapIsEmpty!17220 mapRes!17220))

(declare-fun b!408265 () Bool)

(declare-fun res!236208 () Bool)

(assert (=> b!408265 (=> (not res!236208) (not e!245067))))

(assert (=> b!408265 (= res!236208 (or (= (select (arr!11786 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11786 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38966 res!236207) b!408262))

(assert (= (and b!408262 res!236206) b!408263))

(assert (= (and b!408263 res!236210) b!408260))

(assert (= (and b!408260 res!236209) b!408257))

(assert (= (and b!408257 res!236205) b!408255))

(assert (= (and b!408255 res!236214) b!408254))

(assert (= (and b!408254 res!236213) b!408265))

(assert (= (and b!408265 res!236208) b!408256))

(assert (= (and b!408256 res!236212) b!408253))

(assert (= (and b!408253 res!236211) b!408258))

(assert (= (and b!408261 condMapEmpty!17220) mapIsEmpty!17220))

(assert (= (and b!408261 (not condMapEmpty!17220)) mapNonEmpty!17220))

(get-info :version)

(assert (= (and mapNonEmpty!17220 ((_ is ValueCellFull!4856) mapValue!17220)) b!408259))

(assert (= (and b!408261 ((_ is ValueCellFull!4856) mapDefault!17220)) b!408264))

(assert (= start!38966 b!408261))

(declare-fun m!399885 () Bool)

(assert (=> b!408260 m!399885))

(declare-fun m!399887 () Bool)

(assert (=> b!408258 m!399887))

(declare-fun m!399889 () Bool)

(assert (=> b!408256 m!399889))

(declare-fun m!399891 () Bool)

(assert (=> start!38966 m!399891))

(declare-fun m!399893 () Bool)

(assert (=> start!38966 m!399893))

(declare-fun m!399895 () Bool)

(assert (=> b!408262 m!399895))

(declare-fun m!399897 () Bool)

(assert (=> b!408265 m!399897))

(declare-fun m!399899 () Bool)

(assert (=> b!408257 m!399899))

(declare-fun m!399901 () Bool)

(assert (=> b!408254 m!399901))

(declare-fun m!399903 () Bool)

(assert (=> mapNonEmpty!17220 m!399903))

(declare-fun m!399905 () Bool)

(assert (=> b!408253 m!399905))

(declare-fun m!399907 () Bool)

(assert (=> b!408253 m!399907))

(check-sat (not start!38966) (not b!408260) tp_is_empty!10399 (not b!408258) (not b!408256) (not b!408253) (not mapNonEmpty!17220) (not b!408257) (not b!408262) (not b!408254))
(check-sat)
