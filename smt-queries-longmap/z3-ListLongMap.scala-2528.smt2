; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38972 () Bool)

(assert start!38972)

(declare-fun b!408370 () Bool)

(declare-fun e!245118 () Bool)

(declare-fun tp_is_empty!10405 () Bool)

(assert (=> b!408370 (= e!245118 tp_is_empty!10405)))

(declare-fun b!408371 () Bool)

(declare-fun res!236300 () Bool)

(declare-fun e!245121 () Bool)

(assert (=> b!408371 (=> (not res!236300) (not e!245121))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408371 (= res!236300 (validMask!0 mask!1025))))

(declare-fun b!408372 () Bool)

(declare-fun res!236303 () Bool)

(assert (=> b!408372 (=> (not res!236303) (not e!245121))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408372 (= res!236303 (validKeyInArray!0 k0!794))))

(declare-fun b!408373 () Bool)

(declare-fun res!236302 () Bool)

(assert (=> b!408373 (=> (not res!236302) (not e!245121))))

(declare-datatypes ((array!24684 0))(
  ( (array!24685 (arr!11791 (Array (_ BitVec 32) (_ BitVec 64))) (size!12143 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24684)

(declare-datatypes ((List!6709 0))(
  ( (Nil!6706) (Cons!6705 (h!7561 (_ BitVec 64)) (t!11875 List!6709)) )
))
(declare-fun arrayNoDuplicates!0 (array!24684 (_ BitVec 32) List!6709) Bool)

(assert (=> b!408373 (= res!236302 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6706))))

(declare-fun b!408375 () Bool)

(declare-fun res!236304 () Bool)

(assert (=> b!408375 (=> (not res!236304) (not e!245121))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408375 (= res!236304 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12143 _keys!709))))))

(declare-fun b!408376 () Bool)

(declare-fun res!236296 () Bool)

(assert (=> b!408376 (=> (not res!236296) (not e!245121))))

(assert (=> b!408376 (= res!236296 (or (= (select (arr!11791 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11791 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408377 () Bool)

(declare-fun e!245122 () Bool)

(declare-fun e!245117 () Bool)

(declare-fun mapRes!17229 () Bool)

(assert (=> b!408377 (= e!245122 (and e!245117 mapRes!17229))))

(declare-fun condMapEmpty!17229 () Bool)

(declare-datatypes ((V!14979 0))(
  ( (V!14980 (val!5247 Int)) )
))
(declare-datatypes ((ValueCell!4859 0))(
  ( (ValueCellFull!4859 (v!7495 V!14979)) (EmptyCell!4859) )
))
(declare-datatypes ((array!24686 0))(
  ( (array!24687 (arr!11792 (Array (_ BitVec 32) ValueCell!4859)) (size!12144 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24686)

(declare-fun mapDefault!17229 () ValueCell!4859)

(assert (=> b!408377 (= condMapEmpty!17229 (= (arr!11792 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4859)) mapDefault!17229)))))

(declare-fun mapIsEmpty!17229 () Bool)

(assert (=> mapIsEmpty!17229 mapRes!17229))

(declare-fun b!408378 () Bool)

(assert (=> b!408378 (= e!245117 tp_is_empty!10405)))

(declare-fun b!408379 () Bool)

(declare-fun e!245119 () Bool)

(assert (=> b!408379 (= e!245121 e!245119)))

(declare-fun res!236301 () Bool)

(assert (=> b!408379 (=> (not res!236301) (not e!245119))))

(declare-fun lt!188814 () array!24684)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24684 (_ BitVec 32)) Bool)

(assert (=> b!408379 (= res!236301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188814 mask!1025))))

(assert (=> b!408379 (= lt!188814 (array!24685 (store (arr!11791 _keys!709) i!563 k0!794) (size!12143 _keys!709)))))

(declare-fun mapNonEmpty!17229 () Bool)

(declare-fun tp!33348 () Bool)

(assert (=> mapNonEmpty!17229 (= mapRes!17229 (and tp!33348 e!245118))))

(declare-fun mapValue!17229 () ValueCell!4859)

(declare-fun mapKey!17229 () (_ BitVec 32))

(declare-fun mapRest!17229 () (Array (_ BitVec 32) ValueCell!4859))

(assert (=> mapNonEmpty!17229 (= (arr!11792 _values!549) (store mapRest!17229 mapKey!17229 mapValue!17229))))

(declare-fun b!408380 () Bool)

(declare-fun res!236299 () Bool)

(assert (=> b!408380 (=> (not res!236299) (not e!245121))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408380 (= res!236299 (and (= (size!12144 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12143 _keys!709) (size!12144 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408381 () Bool)

(assert (=> b!408381 (= e!245119 false)))

(declare-fun lt!188813 () Bool)

(assert (=> b!408381 (= lt!188813 (arrayNoDuplicates!0 lt!188814 #b00000000000000000000000000000000 Nil!6706))))

(declare-fun b!408382 () Bool)

(declare-fun res!236295 () Bool)

(assert (=> b!408382 (=> (not res!236295) (not e!245121))))

(assert (=> b!408382 (= res!236295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408374 () Bool)

(declare-fun res!236297 () Bool)

(assert (=> b!408374 (=> (not res!236297) (not e!245121))))

(declare-fun arrayContainsKey!0 (array!24684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408374 (= res!236297 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!236298 () Bool)

(assert (=> start!38972 (=> (not res!236298) (not e!245121))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38972 (= res!236298 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12143 _keys!709))))))

(assert (=> start!38972 e!245121))

(assert (=> start!38972 true))

(declare-fun array_inv!8692 (array!24686) Bool)

(assert (=> start!38972 (and (array_inv!8692 _values!549) e!245122)))

(declare-fun array_inv!8693 (array!24684) Bool)

(assert (=> start!38972 (array_inv!8693 _keys!709)))

(assert (= (and start!38972 res!236298) b!408371))

(assert (= (and b!408371 res!236300) b!408380))

(assert (= (and b!408380 res!236299) b!408382))

(assert (= (and b!408382 res!236295) b!408373))

(assert (= (and b!408373 res!236302) b!408375))

(assert (= (and b!408375 res!236304) b!408372))

(assert (= (and b!408372 res!236303) b!408376))

(assert (= (and b!408376 res!236296) b!408374))

(assert (= (and b!408374 res!236297) b!408379))

(assert (= (and b!408379 res!236301) b!408381))

(assert (= (and b!408377 condMapEmpty!17229) mapIsEmpty!17229))

(assert (= (and b!408377 (not condMapEmpty!17229)) mapNonEmpty!17229))

(get-info :version)

(assert (= (and mapNonEmpty!17229 ((_ is ValueCellFull!4859) mapValue!17229)) b!408370))

(assert (= (and b!408377 ((_ is ValueCellFull!4859) mapDefault!17229)) b!408378))

(assert (= start!38972 b!408377))

(declare-fun m!399957 () Bool)

(assert (=> b!408379 m!399957))

(declare-fun m!399959 () Bool)

(assert (=> b!408379 m!399959))

(declare-fun m!399961 () Bool)

(assert (=> b!408374 m!399961))

(declare-fun m!399963 () Bool)

(assert (=> b!408382 m!399963))

(declare-fun m!399965 () Bool)

(assert (=> b!408381 m!399965))

(declare-fun m!399967 () Bool)

(assert (=> start!38972 m!399967))

(declare-fun m!399969 () Bool)

(assert (=> start!38972 m!399969))

(declare-fun m!399971 () Bool)

(assert (=> b!408371 m!399971))

(declare-fun m!399973 () Bool)

(assert (=> b!408373 m!399973))

(declare-fun m!399975 () Bool)

(assert (=> b!408376 m!399975))

(declare-fun m!399977 () Bool)

(assert (=> b!408372 m!399977))

(declare-fun m!399979 () Bool)

(assert (=> mapNonEmpty!17229 m!399979))

(check-sat (not mapNonEmpty!17229) (not b!408379) (not b!408374) (not b!408382) (not b!408372) (not b!408381) (not b!408371) (not start!38972) (not b!408373) tp_is_empty!10405)
(check-sat)
