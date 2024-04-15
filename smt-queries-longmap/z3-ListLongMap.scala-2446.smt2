; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38480 () Bool)

(assert start!38480)

(declare-fun b!397258 () Bool)

(declare-fun res!228144 () Bool)

(declare-fun e!240225 () Bool)

(assert (=> b!397258 (=> (not res!228144) (not e!240225))))

(declare-datatypes ((array!23721 0))(
  ( (array!23722 (arr!11310 (Array (_ BitVec 32) (_ BitVec 64))) (size!11663 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23721)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14323 0))(
  ( (V!14324 (val!5001 Int)) )
))
(declare-datatypes ((ValueCell!4613 0))(
  ( (ValueCellFull!4613 (v!7242 V!14323)) (EmptyCell!4613) )
))
(declare-datatypes ((array!23723 0))(
  ( (array!23724 (arr!11311 (Array (_ BitVec 32) ValueCell!4613)) (size!11664 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23723)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!397258 (= res!228144 (and (= (size!11664 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11663 _keys!709) (size!11664 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397259 () Bool)

(declare-fun e!240227 () Bool)

(declare-fun tp_is_empty!9913 () Bool)

(assert (=> b!397259 (= e!240227 tp_is_empty!9913)))

(declare-fun mapNonEmpty!16491 () Bool)

(declare-fun mapRes!16491 () Bool)

(declare-fun tp!32286 () Bool)

(assert (=> mapNonEmpty!16491 (= mapRes!16491 (and tp!32286 e!240227))))

(declare-fun mapKey!16491 () (_ BitVec 32))

(declare-fun mapRest!16491 () (Array (_ BitVec 32) ValueCell!4613))

(declare-fun mapValue!16491 () ValueCell!4613)

(assert (=> mapNonEmpty!16491 (= (arr!11311 _values!549) (store mapRest!16491 mapKey!16491 mapValue!16491))))

(declare-fun b!397260 () Bool)

(declare-fun e!240224 () Bool)

(declare-fun e!240226 () Bool)

(assert (=> b!397260 (= e!240224 (and e!240226 mapRes!16491))))

(declare-fun condMapEmpty!16491 () Bool)

(declare-fun mapDefault!16491 () ValueCell!4613)

(assert (=> b!397260 (= condMapEmpty!16491 (= (arr!11311 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4613)) mapDefault!16491)))))

(declare-fun b!397261 () Bool)

(declare-fun res!228143 () Bool)

(assert (=> b!397261 (=> (not res!228143) (not e!240225))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397261 (= res!228143 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11663 _keys!709))))))

(declare-fun b!397262 () Bool)

(declare-fun res!228146 () Bool)

(assert (=> b!397262 (=> (not res!228146) (not e!240225))))

(declare-datatypes ((List!6510 0))(
  ( (Nil!6507) (Cons!6506 (h!7362 (_ BitVec 64)) (t!11675 List!6510)) )
))
(declare-fun arrayNoDuplicates!0 (array!23721 (_ BitVec 32) List!6510) Bool)

(assert (=> b!397262 (= res!228146 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6507))))

(declare-fun b!397263 () Bool)

(declare-fun res!228148 () Bool)

(assert (=> b!397263 (=> (not res!228148) (not e!240225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397263 (= res!228148 (validMask!0 mask!1025))))

(declare-fun b!397264 () Bool)

(declare-fun e!240223 () Bool)

(assert (=> b!397264 (= e!240223 false)))

(declare-fun lt!187085 () Bool)

(declare-fun lt!187084 () array!23721)

(assert (=> b!397264 (= lt!187085 (arrayNoDuplicates!0 lt!187084 #b00000000000000000000000000000000 Nil!6507))))

(declare-fun b!397265 () Bool)

(declare-fun res!228150 () Bool)

(assert (=> b!397265 (=> (not res!228150) (not e!240225))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397265 (= res!228150 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!228147 () Bool)

(assert (=> start!38480 (=> (not res!228147) (not e!240225))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38480 (= res!228147 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11663 _keys!709))))))

(assert (=> start!38480 e!240225))

(assert (=> start!38480 true))

(declare-fun array_inv!8302 (array!23723) Bool)

(assert (=> start!38480 (and (array_inv!8302 _values!549) e!240224)))

(declare-fun array_inv!8303 (array!23721) Bool)

(assert (=> start!38480 (array_inv!8303 _keys!709)))

(declare-fun b!397266 () Bool)

(declare-fun res!228149 () Bool)

(assert (=> b!397266 (=> (not res!228149) (not e!240225))))

(assert (=> b!397266 (= res!228149 (or (= (select (arr!11310 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11310 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397267 () Bool)

(declare-fun res!228142 () Bool)

(assert (=> b!397267 (=> (not res!228142) (not e!240225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23721 (_ BitVec 32)) Bool)

(assert (=> b!397267 (= res!228142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16491 () Bool)

(assert (=> mapIsEmpty!16491 mapRes!16491))

(declare-fun b!397268 () Bool)

(assert (=> b!397268 (= e!240225 e!240223)))

(declare-fun res!228145 () Bool)

(assert (=> b!397268 (=> (not res!228145) (not e!240223))))

(assert (=> b!397268 (= res!228145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187084 mask!1025))))

(assert (=> b!397268 (= lt!187084 (array!23722 (store (arr!11310 _keys!709) i!563 k0!794) (size!11663 _keys!709)))))

(declare-fun b!397269 () Bool)

(assert (=> b!397269 (= e!240226 tp_is_empty!9913)))

(declare-fun b!397270 () Bool)

(declare-fun res!228141 () Bool)

(assert (=> b!397270 (=> (not res!228141) (not e!240225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397270 (= res!228141 (validKeyInArray!0 k0!794))))

(assert (= (and start!38480 res!228147) b!397263))

(assert (= (and b!397263 res!228148) b!397258))

(assert (= (and b!397258 res!228144) b!397267))

(assert (= (and b!397267 res!228142) b!397262))

(assert (= (and b!397262 res!228146) b!397261))

(assert (= (and b!397261 res!228143) b!397270))

(assert (= (and b!397270 res!228141) b!397266))

(assert (= (and b!397266 res!228149) b!397265))

(assert (= (and b!397265 res!228150) b!397268))

(assert (= (and b!397268 res!228145) b!397264))

(assert (= (and b!397260 condMapEmpty!16491) mapIsEmpty!16491))

(assert (= (and b!397260 (not condMapEmpty!16491)) mapNonEmpty!16491))

(get-info :version)

(assert (= (and mapNonEmpty!16491 ((_ is ValueCellFull!4613) mapValue!16491)) b!397259))

(assert (= (and b!397260 ((_ is ValueCellFull!4613) mapDefault!16491)) b!397269))

(assert (= start!38480 b!397260))

(declare-fun m!392019 () Bool)

(assert (=> b!397264 m!392019))

(declare-fun m!392021 () Bool)

(assert (=> b!397268 m!392021))

(declare-fun m!392023 () Bool)

(assert (=> b!397268 m!392023))

(declare-fun m!392025 () Bool)

(assert (=> mapNonEmpty!16491 m!392025))

(declare-fun m!392027 () Bool)

(assert (=> b!397265 m!392027))

(declare-fun m!392029 () Bool)

(assert (=> b!397263 m!392029))

(declare-fun m!392031 () Bool)

(assert (=> b!397270 m!392031))

(declare-fun m!392033 () Bool)

(assert (=> b!397266 m!392033))

(declare-fun m!392035 () Bool)

(assert (=> start!38480 m!392035))

(declare-fun m!392037 () Bool)

(assert (=> start!38480 m!392037))

(declare-fun m!392039 () Bool)

(assert (=> b!397267 m!392039))

(declare-fun m!392041 () Bool)

(assert (=> b!397262 m!392041))

(check-sat (not start!38480) (not b!397265) (not b!397270) (not mapNonEmpty!16491) (not b!397264) (not b!397268) (not b!397267) (not b!397262) tp_is_empty!9913 (not b!397263))
(check-sat)
