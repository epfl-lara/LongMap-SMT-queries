; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38984 () Bool)

(assert start!38984)

(declare-fun b!408382 () Bool)

(declare-fun e!245083 () Bool)

(assert (=> b!408382 (= e!245083 false)))

(declare-fun lt!188597 () Bool)

(declare-datatypes ((array!24697 0))(
  ( (array!24698 (arr!11798 (Array (_ BitVec 32) (_ BitVec 64))) (size!12151 (_ BitVec 32))) )
))
(declare-fun lt!188596 () array!24697)

(declare-datatypes ((List!6811 0))(
  ( (Nil!6808) (Cons!6807 (h!7663 (_ BitVec 64)) (t!11976 List!6811)) )
))
(declare-fun arrayNoDuplicates!0 (array!24697 (_ BitVec 32) List!6811) Bool)

(assert (=> b!408382 (= lt!188597 (arrayNoDuplicates!0 lt!188596 #b00000000000000000000000000000000 Nil!6808))))

(declare-fun res!236350 () Bool)

(declare-fun e!245088 () Bool)

(assert (=> start!38984 (=> (not res!236350) (not e!245088))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!24697)

(assert (=> start!38984 (= res!236350 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12151 _keys!709))))))

(assert (=> start!38984 e!245088))

(assert (=> start!38984 true))

(declare-datatypes ((V!14995 0))(
  ( (V!14996 (val!5253 Int)) )
))
(declare-datatypes ((ValueCell!4865 0))(
  ( (ValueCellFull!4865 (v!7494 V!14995)) (EmptyCell!4865) )
))
(declare-datatypes ((array!24699 0))(
  ( (array!24700 (arr!11799 (Array (_ BitVec 32) ValueCell!4865)) (size!12152 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24699)

(declare-fun e!245087 () Bool)

(declare-fun array_inv!8652 (array!24699) Bool)

(assert (=> start!38984 (and (array_inv!8652 _values!549) e!245087)))

(declare-fun array_inv!8653 (array!24697) Bool)

(assert (=> start!38984 (array_inv!8653 _keys!709)))

(declare-fun b!408383 () Bool)

(declare-fun res!236354 () Bool)

(assert (=> b!408383 (=> (not res!236354) (not e!245088))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408383 (= res!236354 (or (= (select (arr!11798 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11798 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17247 () Bool)

(declare-fun mapRes!17247 () Bool)

(declare-fun tp!33366 () Bool)

(declare-fun e!245086 () Bool)

(assert (=> mapNonEmpty!17247 (= mapRes!17247 (and tp!33366 e!245086))))

(declare-fun mapKey!17247 () (_ BitVec 32))

(declare-fun mapRest!17247 () (Array (_ BitVec 32) ValueCell!4865))

(declare-fun mapValue!17247 () ValueCell!4865)

(assert (=> mapNonEmpty!17247 (= (arr!11799 _values!549) (store mapRest!17247 mapKey!17247 mapValue!17247))))

(declare-fun b!408384 () Bool)

(declare-fun tp_is_empty!10417 () Bool)

(assert (=> b!408384 (= e!245086 tp_is_empty!10417)))

(declare-fun b!408385 () Bool)

(declare-fun e!245084 () Bool)

(assert (=> b!408385 (= e!245087 (and e!245084 mapRes!17247))))

(declare-fun condMapEmpty!17247 () Bool)

(declare-fun mapDefault!17247 () ValueCell!4865)

(assert (=> b!408385 (= condMapEmpty!17247 (= (arr!11799 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4865)) mapDefault!17247)))))

(declare-fun b!408386 () Bool)

(assert (=> b!408386 (= e!245088 e!245083)))

(declare-fun res!236358 () Bool)

(assert (=> b!408386 (=> (not res!236358) (not e!245083))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24697 (_ BitVec 32)) Bool)

(assert (=> b!408386 (= res!236358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188596 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!408386 (= lt!188596 (array!24698 (store (arr!11798 _keys!709) i!563 k0!794) (size!12151 _keys!709)))))

(declare-fun b!408387 () Bool)

(declare-fun res!236355 () Bool)

(assert (=> b!408387 (=> (not res!236355) (not e!245088))))

(assert (=> b!408387 (= res!236355 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6808))))

(declare-fun b!408388 () Bool)

(declare-fun res!236349 () Bool)

(assert (=> b!408388 (=> (not res!236349) (not e!245088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408388 (= res!236349 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17247 () Bool)

(assert (=> mapIsEmpty!17247 mapRes!17247))

(declare-fun b!408389 () Bool)

(declare-fun res!236357 () Bool)

(assert (=> b!408389 (=> (not res!236357) (not e!245088))))

(assert (=> b!408389 (= res!236357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408390 () Bool)

(declare-fun res!236356 () Bool)

(assert (=> b!408390 (=> (not res!236356) (not e!245088))))

(assert (=> b!408390 (= res!236356 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12151 _keys!709))))))

(declare-fun b!408391 () Bool)

(declare-fun res!236352 () Bool)

(assert (=> b!408391 (=> (not res!236352) (not e!245088))))

(declare-fun arrayContainsKey!0 (array!24697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408391 (= res!236352 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408392 () Bool)

(declare-fun res!236353 () Bool)

(assert (=> b!408392 (=> (not res!236353) (not e!245088))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408392 (= res!236353 (and (= (size!12152 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12151 _keys!709) (size!12152 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408393 () Bool)

(assert (=> b!408393 (= e!245084 tp_is_empty!10417)))

(declare-fun b!408394 () Bool)

(declare-fun res!236351 () Bool)

(assert (=> b!408394 (=> (not res!236351) (not e!245088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408394 (= res!236351 (validMask!0 mask!1025))))

(assert (= (and start!38984 res!236350) b!408394))

(assert (= (and b!408394 res!236351) b!408392))

(assert (= (and b!408392 res!236353) b!408389))

(assert (= (and b!408389 res!236357) b!408387))

(assert (= (and b!408387 res!236355) b!408390))

(assert (= (and b!408390 res!236356) b!408388))

(assert (= (and b!408388 res!236349) b!408383))

(assert (= (and b!408383 res!236354) b!408391))

(assert (= (and b!408391 res!236352) b!408386))

(assert (= (and b!408386 res!236358) b!408382))

(assert (= (and b!408385 condMapEmpty!17247) mapIsEmpty!17247))

(assert (= (and b!408385 (not condMapEmpty!17247)) mapNonEmpty!17247))

(get-info :version)

(assert (= (and mapNonEmpty!17247 ((_ is ValueCellFull!4865) mapValue!17247)) b!408384))

(assert (= (and b!408385 ((_ is ValueCellFull!4865) mapDefault!17247)) b!408393))

(assert (= start!38984 b!408385))

(declare-fun m!399147 () Bool)

(assert (=> b!408382 m!399147))

(declare-fun m!399149 () Bool)

(assert (=> b!408383 m!399149))

(declare-fun m!399151 () Bool)

(assert (=> b!408386 m!399151))

(declare-fun m!399153 () Bool)

(assert (=> b!408386 m!399153))

(declare-fun m!399155 () Bool)

(assert (=> b!408389 m!399155))

(declare-fun m!399157 () Bool)

(assert (=> start!38984 m!399157))

(declare-fun m!399159 () Bool)

(assert (=> start!38984 m!399159))

(declare-fun m!399161 () Bool)

(assert (=> b!408391 m!399161))

(declare-fun m!399163 () Bool)

(assert (=> b!408388 m!399163))

(declare-fun m!399165 () Bool)

(assert (=> b!408387 m!399165))

(declare-fun m!399167 () Bool)

(assert (=> b!408394 m!399167))

(declare-fun m!399169 () Bool)

(assert (=> mapNonEmpty!17247 m!399169))

(check-sat tp_is_empty!10417 (not b!408387) (not b!408394) (not mapNonEmpty!17247) (not start!38984) (not b!408382) (not b!408391) (not b!408388) (not b!408389) (not b!408386))
(check-sat)
