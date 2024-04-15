; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38978 () Bool)

(assert start!38978)

(declare-fun b!408265 () Bool)

(declare-fun res!236264 () Bool)

(declare-fun e!245031 () Bool)

(assert (=> b!408265 (=> (not res!236264) (not e!245031))))

(declare-datatypes ((array!24687 0))(
  ( (array!24688 (arr!11793 (Array (_ BitVec 32) (_ BitVec 64))) (size!12146 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24687)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14987 0))(
  ( (V!14988 (val!5250 Int)) )
))
(declare-datatypes ((ValueCell!4862 0))(
  ( (ValueCellFull!4862 (v!7491 V!14987)) (EmptyCell!4862) )
))
(declare-datatypes ((array!24689 0))(
  ( (array!24690 (arr!11794 (Array (_ BitVec 32) ValueCell!4862)) (size!12147 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24689)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!408265 (= res!236264 (and (= (size!12147 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12146 _keys!709) (size!12147 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17238 () Bool)

(declare-fun mapRes!17238 () Bool)

(declare-fun tp!33357 () Bool)

(declare-fun e!245032 () Bool)

(assert (=> mapNonEmpty!17238 (= mapRes!17238 (and tp!33357 e!245032))))

(declare-fun mapKey!17238 () (_ BitVec 32))

(declare-fun mapValue!17238 () ValueCell!4862)

(declare-fun mapRest!17238 () (Array (_ BitVec 32) ValueCell!4862))

(assert (=> mapNonEmpty!17238 (= (arr!11794 _values!549) (store mapRest!17238 mapKey!17238 mapValue!17238))))

(declare-fun b!408266 () Bool)

(declare-fun e!245030 () Bool)

(assert (=> b!408266 (= e!245030 false)))

(declare-fun lt!188578 () Bool)

(declare-fun lt!188579 () array!24687)

(declare-datatypes ((List!6810 0))(
  ( (Nil!6807) (Cons!6806 (h!7662 (_ BitVec 64)) (t!11975 List!6810)) )
))
(declare-fun arrayNoDuplicates!0 (array!24687 (_ BitVec 32) List!6810) Bool)

(assert (=> b!408266 (= lt!188578 (arrayNoDuplicates!0 lt!188579 #b00000000000000000000000000000000 Nil!6807))))

(declare-fun b!408267 () Bool)

(declare-fun e!245029 () Bool)

(declare-fun tp_is_empty!10411 () Bool)

(assert (=> b!408267 (= e!245029 tp_is_empty!10411)))

(declare-fun b!408268 () Bool)

(declare-fun res!236259 () Bool)

(assert (=> b!408268 (=> (not res!236259) (not e!245031))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408268 (= res!236259 (validKeyInArray!0 k0!794))))

(declare-fun b!408269 () Bool)

(declare-fun res!236260 () Bool)

(assert (=> b!408269 (=> (not res!236260) (not e!245031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408269 (= res!236260 (validMask!0 mask!1025))))

(declare-fun b!408270 () Bool)

(declare-fun res!236268 () Bool)

(assert (=> b!408270 (=> (not res!236268) (not e!245031))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408270 (= res!236268 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12146 _keys!709))))))

(declare-fun res!236265 () Bool)

(assert (=> start!38978 (=> (not res!236265) (not e!245031))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38978 (= res!236265 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12146 _keys!709))))))

(assert (=> start!38978 e!245031))

(assert (=> start!38978 true))

(declare-fun e!245034 () Bool)

(declare-fun array_inv!8650 (array!24689) Bool)

(assert (=> start!38978 (and (array_inv!8650 _values!549) e!245034)))

(declare-fun array_inv!8651 (array!24687) Bool)

(assert (=> start!38978 (array_inv!8651 _keys!709)))

(declare-fun b!408271 () Bool)

(declare-fun res!236262 () Bool)

(assert (=> b!408271 (=> (not res!236262) (not e!245031))))

(declare-fun arrayContainsKey!0 (array!24687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408271 (= res!236262 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408272 () Bool)

(assert (=> b!408272 (= e!245034 (and e!245029 mapRes!17238))))

(declare-fun condMapEmpty!17238 () Bool)

(declare-fun mapDefault!17238 () ValueCell!4862)

(assert (=> b!408272 (= condMapEmpty!17238 (= (arr!11794 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4862)) mapDefault!17238)))))

(declare-fun b!408273 () Bool)

(declare-fun res!236263 () Bool)

(assert (=> b!408273 (=> (not res!236263) (not e!245031))))

(assert (=> b!408273 (= res!236263 (or (= (select (arr!11793 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11793 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!408274 () Bool)

(assert (=> b!408274 (= e!245031 e!245030)))

(declare-fun res!236261 () Bool)

(assert (=> b!408274 (=> (not res!236261) (not e!245030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24687 (_ BitVec 32)) Bool)

(assert (=> b!408274 (= res!236261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188579 mask!1025))))

(assert (=> b!408274 (= lt!188579 (array!24688 (store (arr!11793 _keys!709) i!563 k0!794) (size!12146 _keys!709)))))

(declare-fun b!408275 () Bool)

(assert (=> b!408275 (= e!245032 tp_is_empty!10411)))

(declare-fun b!408276 () Bool)

(declare-fun res!236266 () Bool)

(assert (=> b!408276 (=> (not res!236266) (not e!245031))))

(assert (=> b!408276 (= res!236266 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6807))))

(declare-fun b!408277 () Bool)

(declare-fun res!236267 () Bool)

(assert (=> b!408277 (=> (not res!236267) (not e!245031))))

(assert (=> b!408277 (= res!236267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17238 () Bool)

(assert (=> mapIsEmpty!17238 mapRes!17238))

(assert (= (and start!38978 res!236265) b!408269))

(assert (= (and b!408269 res!236260) b!408265))

(assert (= (and b!408265 res!236264) b!408277))

(assert (= (and b!408277 res!236267) b!408276))

(assert (= (and b!408276 res!236266) b!408270))

(assert (= (and b!408270 res!236268) b!408268))

(assert (= (and b!408268 res!236259) b!408273))

(assert (= (and b!408273 res!236263) b!408271))

(assert (= (and b!408271 res!236262) b!408274))

(assert (= (and b!408274 res!236261) b!408266))

(assert (= (and b!408272 condMapEmpty!17238) mapIsEmpty!17238))

(assert (= (and b!408272 (not condMapEmpty!17238)) mapNonEmpty!17238))

(get-info :version)

(assert (= (and mapNonEmpty!17238 ((_ is ValueCellFull!4862) mapValue!17238)) b!408275))

(assert (= (and b!408272 ((_ is ValueCellFull!4862) mapDefault!17238)) b!408267))

(assert (= start!38978 b!408272))

(declare-fun m!399075 () Bool)

(assert (=> b!408277 m!399075))

(declare-fun m!399077 () Bool)

(assert (=> b!408266 m!399077))

(declare-fun m!399079 () Bool)

(assert (=> b!408271 m!399079))

(declare-fun m!399081 () Bool)

(assert (=> b!408274 m!399081))

(declare-fun m!399083 () Bool)

(assert (=> b!408274 m!399083))

(declare-fun m!399085 () Bool)

(assert (=> b!408269 m!399085))

(declare-fun m!399087 () Bool)

(assert (=> mapNonEmpty!17238 m!399087))

(declare-fun m!399089 () Bool)

(assert (=> b!408268 m!399089))

(declare-fun m!399091 () Bool)

(assert (=> b!408276 m!399091))

(declare-fun m!399093 () Bool)

(assert (=> b!408273 m!399093))

(declare-fun m!399095 () Bool)

(assert (=> start!38978 m!399095))

(declare-fun m!399097 () Bool)

(assert (=> start!38978 m!399097))

(check-sat (not mapNonEmpty!17238) (not b!408271) (not start!38978) (not b!408274) (not b!408276) (not b!408266) (not b!408269) tp_is_empty!10411 (not b!408277) (not b!408268))
(check-sat)
