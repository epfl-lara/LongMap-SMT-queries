; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40982 () Bool)

(assert start!40982)

(declare-fun b_free!10917 () Bool)

(declare-fun b_next!10917 () Bool)

(assert (=> start!40982 (= b_free!10917 (not b_next!10917))))

(declare-fun tp!38578 () Bool)

(declare-fun b_and!19059 () Bool)

(assert (=> start!40982 (= tp!38578 b_and!19059)))

(declare-fun b!456257 () Bool)

(declare-fun e!266610 () Bool)

(declare-fun tp_is_empty!12255 () Bool)

(assert (=> b!456257 (= e!266610 tp_is_empty!12255)))

(declare-fun b!456258 () Bool)

(declare-fun res!272221 () Bool)

(declare-fun e!266608 () Bool)

(assert (=> b!456258 (=> (not res!272221) (not e!266608))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456258 (= res!272221 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!20023 () Bool)

(declare-fun mapRes!20023 () Bool)

(declare-fun tp!38577 () Bool)

(declare-fun e!266607 () Bool)

(assert (=> mapNonEmpty!20023 (= mapRes!20023 (and tp!38577 e!266607))))

(declare-datatypes ((V!17445 0))(
  ( (V!17446 (val!6172 Int)) )
))
(declare-datatypes ((ValueCell!5784 0))(
  ( (ValueCellFull!5784 (v!8438 V!17445)) (EmptyCell!5784) )
))
(declare-datatypes ((array!28313 0))(
  ( (array!28314 (arr!13600 (Array (_ BitVec 32) ValueCell!5784)) (size!13952 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28313)

(declare-fun mapValue!20023 () ValueCell!5784)

(declare-fun mapRest!20023 () (Array (_ BitVec 32) ValueCell!5784))

(declare-fun mapKey!20023 () (_ BitVec 32))

(assert (=> mapNonEmpty!20023 (= (arr!13600 _values!549) (store mapRest!20023 mapKey!20023 mapValue!20023))))

(declare-fun b!456259 () Bool)

(declare-fun res!272229 () Bool)

(declare-fun e!266611 () Bool)

(assert (=> b!456259 (=> (not res!272229) (not e!266611))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456259 (= res!272229 (bvsle from!863 i!563))))

(declare-fun b!456260 () Bool)

(declare-fun res!272226 () Bool)

(assert (=> b!456260 (=> (not res!272226) (not e!266608))))

(declare-datatypes ((array!28315 0))(
  ( (array!28316 (arr!13601 (Array (_ BitVec 32) (_ BitVec 64))) (size!13953 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28315)

(assert (=> b!456260 (= res!272226 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13953 _keys!709))))))

(declare-fun b!456261 () Bool)

(declare-fun res!272230 () Bool)

(assert (=> b!456261 (=> (not res!272230) (not e!266608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28315 (_ BitVec 32)) Bool)

(assert (=> b!456261 (= res!272230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456262 () Bool)

(assert (=> b!456262 (= e!266611 (and (not (= from!863 i!563)) (bvslt from!863 i!563) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13953 _keys!709)) (bvsge (bvsub (size!13953 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (bvsub (size!13953 _keys!709) from!863))))))

(declare-fun minValue!515 () V!17445)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17445)

(declare-datatypes ((tuple2!8132 0))(
  ( (tuple2!8133 (_1!4077 (_ BitVec 64)) (_2!4077 V!17445)) )
))
(declare-datatypes ((List!8204 0))(
  ( (Nil!8201) (Cons!8200 (h!9056 tuple2!8132) (t!14032 List!8204)) )
))
(declare-datatypes ((ListLongMap!7045 0))(
  ( (ListLongMap!7046 (toList!3538 List!8204)) )
))
(declare-fun lt!206499 () ListLongMap!7045)

(declare-fun lt!206500 () array!28315)

(declare-fun v!412 () V!17445)

(declare-fun getCurrentListMapNoExtraKeys!1721 (array!28315 array!28313 (_ BitVec 32) (_ BitVec 32) V!17445 V!17445 (_ BitVec 32) Int) ListLongMap!7045)

(assert (=> b!456262 (= lt!206499 (getCurrentListMapNoExtraKeys!1721 lt!206500 (array!28314 (store (arr!13600 _values!549) i!563 (ValueCellFull!5784 v!412)) (size!13952 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206501 () ListLongMap!7045)

(assert (=> b!456262 (= lt!206501 (getCurrentListMapNoExtraKeys!1721 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456263 () Bool)

(declare-fun res!272224 () Bool)

(assert (=> b!456263 (=> (not res!272224) (not e!266608))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456263 (= res!272224 (validKeyInArray!0 k0!794))))

(declare-fun b!456265 () Bool)

(declare-fun res!272225 () Bool)

(assert (=> b!456265 (=> (not res!272225) (not e!266608))))

(declare-fun arrayContainsKey!0 (array!28315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456265 (= res!272225 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456266 () Bool)

(declare-fun res!272220 () Bool)

(assert (=> b!456266 (=> (not res!272220) (not e!266608))))

(declare-datatypes ((List!8205 0))(
  ( (Nil!8202) (Cons!8201 (h!9057 (_ BitVec 64)) (t!14033 List!8205)) )
))
(declare-fun arrayNoDuplicates!0 (array!28315 (_ BitVec 32) List!8205) Bool)

(assert (=> b!456266 (= res!272220 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8202))))

(declare-fun b!456267 () Bool)

(declare-fun res!272222 () Bool)

(assert (=> b!456267 (=> (not res!272222) (not e!266608))))

(assert (=> b!456267 (= res!272222 (or (= (select (arr!13601 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13601 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456268 () Bool)

(declare-fun res!272223 () Bool)

(assert (=> b!456268 (=> (not res!272223) (not e!266608))))

(assert (=> b!456268 (= res!272223 (and (= (size!13952 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13953 _keys!709) (size!13952 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!272227 () Bool)

(assert (=> start!40982 (=> (not res!272227) (not e!266608))))

(assert (=> start!40982 (= res!272227 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13953 _keys!709))))))

(assert (=> start!40982 e!266608))

(assert (=> start!40982 tp_is_empty!12255))

(assert (=> start!40982 tp!38578))

(assert (=> start!40982 true))

(declare-fun e!266609 () Bool)

(declare-fun array_inv!9856 (array!28313) Bool)

(assert (=> start!40982 (and (array_inv!9856 _values!549) e!266609)))

(declare-fun array_inv!9857 (array!28315) Bool)

(assert (=> start!40982 (array_inv!9857 _keys!709)))

(declare-fun b!456264 () Bool)

(declare-fun res!272228 () Bool)

(assert (=> b!456264 (=> (not res!272228) (not e!266611))))

(assert (=> b!456264 (= res!272228 (arrayNoDuplicates!0 lt!206500 #b00000000000000000000000000000000 Nil!8202))))

(declare-fun b!456269 () Bool)

(assert (=> b!456269 (= e!266608 e!266611)))

(declare-fun res!272231 () Bool)

(assert (=> b!456269 (=> (not res!272231) (not e!266611))))

(assert (=> b!456269 (= res!272231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206500 mask!1025))))

(assert (=> b!456269 (= lt!206500 (array!28316 (store (arr!13601 _keys!709) i!563 k0!794) (size!13953 _keys!709)))))

(declare-fun b!456270 () Bool)

(assert (=> b!456270 (= e!266607 tp_is_empty!12255)))

(declare-fun b!456271 () Bool)

(assert (=> b!456271 (= e!266609 (and e!266610 mapRes!20023))))

(declare-fun condMapEmpty!20023 () Bool)

(declare-fun mapDefault!20023 () ValueCell!5784)

(assert (=> b!456271 (= condMapEmpty!20023 (= (arr!13600 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5784)) mapDefault!20023)))))

(declare-fun mapIsEmpty!20023 () Bool)

(assert (=> mapIsEmpty!20023 mapRes!20023))

(assert (= (and start!40982 res!272227) b!456258))

(assert (= (and b!456258 res!272221) b!456268))

(assert (= (and b!456268 res!272223) b!456261))

(assert (= (and b!456261 res!272230) b!456266))

(assert (= (and b!456266 res!272220) b!456260))

(assert (= (and b!456260 res!272226) b!456263))

(assert (= (and b!456263 res!272224) b!456267))

(assert (= (and b!456267 res!272222) b!456265))

(assert (= (and b!456265 res!272225) b!456269))

(assert (= (and b!456269 res!272231) b!456264))

(assert (= (and b!456264 res!272228) b!456259))

(assert (= (and b!456259 res!272229) b!456262))

(assert (= (and b!456271 condMapEmpty!20023) mapIsEmpty!20023))

(assert (= (and b!456271 (not condMapEmpty!20023)) mapNonEmpty!20023))

(get-info :version)

(assert (= (and mapNonEmpty!20023 ((_ is ValueCellFull!5784) mapValue!20023)) b!456270))

(assert (= (and b!456271 ((_ is ValueCellFull!5784) mapDefault!20023)) b!456257))

(assert (= start!40982 b!456271))

(declare-fun m!439771 () Bool)

(assert (=> b!456269 m!439771))

(declare-fun m!439773 () Bool)

(assert (=> b!456269 m!439773))

(declare-fun m!439775 () Bool)

(assert (=> b!456263 m!439775))

(declare-fun m!439777 () Bool)

(assert (=> b!456267 m!439777))

(declare-fun m!439779 () Bool)

(assert (=> b!456265 m!439779))

(declare-fun m!439781 () Bool)

(assert (=> mapNonEmpty!20023 m!439781))

(declare-fun m!439783 () Bool)

(assert (=> b!456258 m!439783))

(declare-fun m!439785 () Bool)

(assert (=> b!456266 m!439785))

(declare-fun m!439787 () Bool)

(assert (=> start!40982 m!439787))

(declare-fun m!439789 () Bool)

(assert (=> start!40982 m!439789))

(declare-fun m!439791 () Bool)

(assert (=> b!456264 m!439791))

(declare-fun m!439793 () Bool)

(assert (=> b!456261 m!439793))

(declare-fun m!439795 () Bool)

(assert (=> b!456262 m!439795))

(declare-fun m!439797 () Bool)

(assert (=> b!456262 m!439797))

(declare-fun m!439799 () Bool)

(assert (=> b!456262 m!439799))

(check-sat (not b!456261) (not b!456266) (not start!40982) (not mapNonEmpty!20023) b_and!19059 (not b!456263) (not b!456269) (not b_next!10917) (not b!456262) (not b!456265) tp_is_empty!12255 (not b!456264) (not b!456258))
(check-sat b_and!19059 (not b_next!10917))
