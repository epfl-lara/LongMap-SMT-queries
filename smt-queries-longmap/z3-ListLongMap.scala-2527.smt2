; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38966 () Bool)

(assert start!38966)

(declare-fun b!408031 () Bool)

(declare-fun e!244924 () Bool)

(assert (=> b!408031 (= e!244924 false)))

(declare-fun lt!188543 () Bool)

(declare-datatypes ((array!24665 0))(
  ( (array!24666 (arr!11782 (Array (_ BitVec 32) (_ BitVec 64))) (size!12135 (_ BitVec 32))) )
))
(declare-fun lt!188542 () array!24665)

(declare-datatypes ((List!6805 0))(
  ( (Nil!6802) (Cons!6801 (h!7657 (_ BitVec 64)) (t!11970 List!6805)) )
))
(declare-fun arrayNoDuplicates!0 (array!24665 (_ BitVec 32) List!6805) Bool)

(assert (=> b!408031 (= lt!188543 (arrayNoDuplicates!0 lt!188542 #b00000000000000000000000000000000 Nil!6802))))

(declare-fun b!408032 () Bool)

(declare-fun res!236083 () Bool)

(declare-fun e!244922 () Bool)

(assert (=> b!408032 (=> (not res!236083) (not e!244922))))

(declare-fun _keys!709 () array!24665)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24665 (_ BitVec 32)) Bool)

(assert (=> b!408032 (= res!236083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408034 () Bool)

(declare-fun res!236088 () Bool)

(assert (=> b!408034 (=> (not res!236088) (not e!244922))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408034 (= res!236088 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17220 () Bool)

(declare-fun mapRes!17220 () Bool)

(assert (=> mapIsEmpty!17220 mapRes!17220))

(declare-fun b!408035 () Bool)

(declare-fun e!244923 () Bool)

(declare-fun tp_is_empty!10399 () Bool)

(assert (=> b!408035 (= e!244923 tp_is_empty!10399)))

(declare-fun mapNonEmpty!17220 () Bool)

(declare-fun tp!33339 () Bool)

(assert (=> mapNonEmpty!17220 (= mapRes!17220 (and tp!33339 e!244923))))

(declare-fun mapKey!17220 () (_ BitVec 32))

(declare-datatypes ((V!14971 0))(
  ( (V!14972 (val!5244 Int)) )
))
(declare-datatypes ((ValueCell!4856 0))(
  ( (ValueCellFull!4856 (v!7485 V!14971)) (EmptyCell!4856) )
))
(declare-fun mapRest!17220 () (Array (_ BitVec 32) ValueCell!4856))

(declare-fun mapValue!17220 () ValueCell!4856)

(declare-datatypes ((array!24667 0))(
  ( (array!24668 (arr!11783 (Array (_ BitVec 32) ValueCell!4856)) (size!12136 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24667)

(assert (=> mapNonEmpty!17220 (= (arr!11783 _values!549) (store mapRest!17220 mapKey!17220 mapValue!17220))))

(declare-fun b!408036 () Bool)

(declare-fun res!236081 () Bool)

(assert (=> b!408036 (=> (not res!236081) (not e!244922))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408036 (= res!236081 (and (= (size!12136 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12135 _keys!709) (size!12136 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408037 () Bool)

(declare-fun e!244926 () Bool)

(declare-fun e!244925 () Bool)

(assert (=> b!408037 (= e!244926 (and e!244925 mapRes!17220))))

(declare-fun condMapEmpty!17220 () Bool)

(declare-fun mapDefault!17220 () ValueCell!4856)

(assert (=> b!408037 (= condMapEmpty!17220 (= (arr!11783 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4856)) mapDefault!17220)))))

(declare-fun b!408038 () Bool)

(declare-fun res!236082 () Bool)

(assert (=> b!408038 (=> (not res!236082) (not e!244922))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408038 (= res!236082 (or (= (select (arr!11782 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11782 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408039 () Bool)

(declare-fun res!236087 () Bool)

(assert (=> b!408039 (=> (not res!236087) (not e!244922))))

(assert (=> b!408039 (= res!236087 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6802))))

(declare-fun b!408040 () Bool)

(declare-fun res!236079 () Bool)

(assert (=> b!408040 (=> (not res!236079) (not e!244922))))

(assert (=> b!408040 (= res!236079 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12135 _keys!709))))))

(declare-fun b!408041 () Bool)

(declare-fun res!236084 () Bool)

(assert (=> b!408041 (=> (not res!236084) (not e!244922))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408041 (= res!236084 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!236080 () Bool)

(assert (=> start!38966 (=> (not res!236080) (not e!244922))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38966 (= res!236080 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12135 _keys!709))))))

(assert (=> start!38966 e!244922))

(assert (=> start!38966 true))

(declare-fun array_inv!8640 (array!24667) Bool)

(assert (=> start!38966 (and (array_inv!8640 _values!549) e!244926)))

(declare-fun array_inv!8641 (array!24665) Bool)

(assert (=> start!38966 (array_inv!8641 _keys!709)))

(declare-fun b!408033 () Bool)

(assert (=> b!408033 (= e!244922 e!244924)))

(declare-fun res!236086 () Bool)

(assert (=> b!408033 (=> (not res!236086) (not e!244924))))

(assert (=> b!408033 (= res!236086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188542 mask!1025))))

(assert (=> b!408033 (= lt!188542 (array!24666 (store (arr!11782 _keys!709) i!563 k0!794) (size!12135 _keys!709)))))

(declare-fun b!408042 () Bool)

(assert (=> b!408042 (= e!244925 tp_is_empty!10399)))

(declare-fun b!408043 () Bool)

(declare-fun res!236085 () Bool)

(assert (=> b!408043 (=> (not res!236085) (not e!244922))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408043 (= res!236085 (validKeyInArray!0 k0!794))))

(assert (= (and start!38966 res!236080) b!408034))

(assert (= (and b!408034 res!236088) b!408036))

(assert (= (and b!408036 res!236081) b!408032))

(assert (= (and b!408032 res!236083) b!408039))

(assert (= (and b!408039 res!236087) b!408040))

(assert (= (and b!408040 res!236079) b!408043))

(assert (= (and b!408043 res!236085) b!408038))

(assert (= (and b!408038 res!236082) b!408041))

(assert (= (and b!408041 res!236084) b!408033))

(assert (= (and b!408033 res!236086) b!408031))

(assert (= (and b!408037 condMapEmpty!17220) mapIsEmpty!17220))

(assert (= (and b!408037 (not condMapEmpty!17220)) mapNonEmpty!17220))

(get-info :version)

(assert (= (and mapNonEmpty!17220 ((_ is ValueCellFull!4856) mapValue!17220)) b!408035))

(assert (= (and b!408037 ((_ is ValueCellFull!4856) mapDefault!17220)) b!408042))

(assert (= start!38966 b!408037))

(declare-fun m!398931 () Bool)

(assert (=> b!408034 m!398931))

(declare-fun m!398933 () Bool)

(assert (=> b!408033 m!398933))

(declare-fun m!398935 () Bool)

(assert (=> b!408033 m!398935))

(declare-fun m!398937 () Bool)

(assert (=> b!408043 m!398937))

(declare-fun m!398939 () Bool)

(assert (=> b!408032 m!398939))

(declare-fun m!398941 () Bool)

(assert (=> b!408038 m!398941))

(declare-fun m!398943 () Bool)

(assert (=> b!408041 m!398943))

(declare-fun m!398945 () Bool)

(assert (=> start!38966 m!398945))

(declare-fun m!398947 () Bool)

(assert (=> start!38966 m!398947))

(declare-fun m!398949 () Bool)

(assert (=> b!408031 m!398949))

(declare-fun m!398951 () Bool)

(assert (=> b!408039 m!398951))

(declare-fun m!398953 () Bool)

(assert (=> mapNonEmpty!17220 m!398953))

(check-sat (not b!408031) (not start!38966) (not mapNonEmpty!17220) (not b!408033) (not b!408032) (not b!408041) (not b!408039) (not b!408043) (not b!408034) tp_is_empty!10399)
(check-sat)
