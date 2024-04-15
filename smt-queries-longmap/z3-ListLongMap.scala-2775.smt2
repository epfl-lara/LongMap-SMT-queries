; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40508 () Bool)

(assert start!40508)

(declare-fun b!446192 () Bool)

(declare-fun e!262117 () Bool)

(declare-fun tp_is_empty!11887 () Bool)

(assert (=> b!446192 (= e!262117 tp_is_empty!11887)))

(declare-fun b!446193 () Bool)

(declare-fun res!264870 () Bool)

(declare-fun e!262121 () Bool)

(assert (=> b!446193 (=> (not res!264870) (not e!262121))))

(declare-datatypes ((array!27583 0))(
  ( (array!27584 (arr!13238 (Array (_ BitVec 32) (_ BitVec 64))) (size!13591 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27583)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16955 0))(
  ( (V!16956 (val!5988 Int)) )
))
(declare-datatypes ((ValueCell!5600 0))(
  ( (ValueCellFull!5600 (v!8237 V!16955)) (EmptyCell!5600) )
))
(declare-datatypes ((array!27585 0))(
  ( (array!27586 (arr!13239 (Array (_ BitVec 32) ValueCell!5600)) (size!13592 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27585)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!446193 (= res!264870 (and (= (size!13592 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13591 _keys!709) (size!13592 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19461 () Bool)

(declare-fun mapRes!19461 () Bool)

(assert (=> mapIsEmpty!19461 mapRes!19461))

(declare-fun b!446194 () Bool)

(declare-fun res!264879 () Bool)

(assert (=> b!446194 (=> (not res!264879) (not e!262121))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446194 (= res!264879 (or (= (select (arr!13238 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13238 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446195 () Bool)

(declare-fun res!264873 () Bool)

(assert (=> b!446195 (=> (not res!264873) (not e!262121))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446195 (= res!264873 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446196 () Bool)

(declare-fun res!264878 () Bool)

(assert (=> b!446196 (=> (not res!264878) (not e!262121))))

(declare-datatypes ((List!7925 0))(
  ( (Nil!7922) (Cons!7921 (h!8777 (_ BitVec 64)) (t!13676 List!7925)) )
))
(declare-fun arrayNoDuplicates!0 (array!27583 (_ BitVec 32) List!7925) Bool)

(assert (=> b!446196 (= res!264878 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7922))))

(declare-fun b!446197 () Bool)

(declare-fun res!264871 () Bool)

(assert (=> b!446197 (=> (not res!264871) (not e!262121))))

(assert (=> b!446197 (= res!264871 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13591 _keys!709))))))

(declare-fun b!446198 () Bool)

(declare-fun res!264876 () Bool)

(assert (=> b!446198 (=> (not res!264876) (not e!262121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446198 (= res!264876 (validKeyInArray!0 k0!794))))

(declare-fun b!446199 () Bool)

(declare-fun e!262119 () Bool)

(assert (=> b!446199 (= e!262121 e!262119)))

(declare-fun res!264874 () Bool)

(assert (=> b!446199 (=> (not res!264874) (not e!262119))))

(declare-fun lt!203579 () array!27583)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27583 (_ BitVec 32)) Bool)

(assert (=> b!446199 (= res!264874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203579 mask!1025))))

(assert (=> b!446199 (= lt!203579 (array!27584 (store (arr!13238 _keys!709) i!563 k0!794) (size!13591 _keys!709)))))

(declare-fun b!446201 () Bool)

(declare-fun e!262118 () Bool)

(assert (=> b!446201 (= e!262118 (and e!262117 mapRes!19461))))

(declare-fun condMapEmpty!19461 () Bool)

(declare-fun mapDefault!19461 () ValueCell!5600)

(assert (=> b!446201 (= condMapEmpty!19461 (= (arr!13239 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5600)) mapDefault!19461)))))

(declare-fun b!446202 () Bool)

(assert (=> b!446202 (= e!262119 false)))

(declare-fun lt!203578 () Bool)

(assert (=> b!446202 (= lt!203578 (arrayNoDuplicates!0 lt!203579 #b00000000000000000000000000000000 Nil!7922))))

(declare-fun b!446203 () Bool)

(declare-fun res!264875 () Bool)

(assert (=> b!446203 (=> (not res!264875) (not e!262121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446203 (= res!264875 (validMask!0 mask!1025))))

(declare-fun b!446204 () Bool)

(declare-fun e!262122 () Bool)

(assert (=> b!446204 (= e!262122 tp_is_empty!11887)))

(declare-fun mapNonEmpty!19461 () Bool)

(declare-fun tp!37488 () Bool)

(assert (=> mapNonEmpty!19461 (= mapRes!19461 (and tp!37488 e!262122))))

(declare-fun mapKey!19461 () (_ BitVec 32))

(declare-fun mapRest!19461 () (Array (_ BitVec 32) ValueCell!5600))

(declare-fun mapValue!19461 () ValueCell!5600)

(assert (=> mapNonEmpty!19461 (= (arr!13239 _values!549) (store mapRest!19461 mapKey!19461 mapValue!19461))))

(declare-fun res!264872 () Bool)

(assert (=> start!40508 (=> (not res!264872) (not e!262121))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40508 (= res!264872 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13591 _keys!709))))))

(assert (=> start!40508 e!262121))

(assert (=> start!40508 true))

(declare-fun array_inv!9650 (array!27585) Bool)

(assert (=> start!40508 (and (array_inv!9650 _values!549) e!262118)))

(declare-fun array_inv!9651 (array!27583) Bool)

(assert (=> start!40508 (array_inv!9651 _keys!709)))

(declare-fun b!446200 () Bool)

(declare-fun res!264877 () Bool)

(assert (=> b!446200 (=> (not res!264877) (not e!262121))))

(assert (=> b!446200 (= res!264877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40508 res!264872) b!446203))

(assert (= (and b!446203 res!264875) b!446193))

(assert (= (and b!446193 res!264870) b!446200))

(assert (= (and b!446200 res!264877) b!446196))

(assert (= (and b!446196 res!264878) b!446197))

(assert (= (and b!446197 res!264871) b!446198))

(assert (= (and b!446198 res!264876) b!446194))

(assert (= (and b!446194 res!264879) b!446195))

(assert (= (and b!446195 res!264873) b!446199))

(assert (= (and b!446199 res!264874) b!446202))

(assert (= (and b!446201 condMapEmpty!19461) mapIsEmpty!19461))

(assert (= (and b!446201 (not condMapEmpty!19461)) mapNonEmpty!19461))

(get-info :version)

(assert (= (and mapNonEmpty!19461 ((_ is ValueCellFull!5600) mapValue!19461)) b!446204))

(assert (= (and b!446201 ((_ is ValueCellFull!5600) mapDefault!19461)) b!446192))

(assert (= start!40508 b!446201))

(declare-fun m!430965 () Bool)

(assert (=> b!446202 m!430965))

(declare-fun m!430967 () Bool)

(assert (=> b!446194 m!430967))

(declare-fun m!430969 () Bool)

(assert (=> mapNonEmpty!19461 m!430969))

(declare-fun m!430971 () Bool)

(assert (=> b!446200 m!430971))

(declare-fun m!430973 () Bool)

(assert (=> b!446199 m!430973))

(declare-fun m!430975 () Bool)

(assert (=> b!446199 m!430975))

(declare-fun m!430977 () Bool)

(assert (=> start!40508 m!430977))

(declare-fun m!430979 () Bool)

(assert (=> start!40508 m!430979))

(declare-fun m!430981 () Bool)

(assert (=> b!446203 m!430981))

(declare-fun m!430983 () Bool)

(assert (=> b!446198 m!430983))

(declare-fun m!430985 () Bool)

(assert (=> b!446195 m!430985))

(declare-fun m!430987 () Bool)

(assert (=> b!446196 m!430987))

(check-sat (not start!40508) (not b!446200) (not b!446202) tp_is_empty!11887 (not b!446199) (not b!446195) (not mapNonEmpty!19461) (not b!446198) (not b!446196) (not b!446203))
(check-sat)
