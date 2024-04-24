; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33466 () Bool)

(assert start!33466)

(declare-fun b!332254 () Bool)

(declare-fun res!183063 () Bool)

(declare-fun e!204002 () Bool)

(assert (=> b!332254 (=> (not res!183063) (not e!204002))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9955 0))(
  ( (V!9956 (val!3411 Int)) )
))
(declare-datatypes ((ValueCell!3023 0))(
  ( (ValueCellFull!3023 (v!5571 V!9955)) (EmptyCell!3023) )
))
(declare-datatypes ((array!17062 0))(
  ( (array!17063 (arr!8065 (Array (_ BitVec 32) ValueCell!3023)) (size!8417 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17062)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((array!17064 0))(
  ( (array!17065 (arr!8066 (Array (_ BitVec 32) (_ BitVec 64))) (size!8418 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17064)

(assert (=> b!332254 (= res!183063 (and (= (size!8417 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8418 _keys!1895) (size!8417 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!183064 () Bool)

(assert (=> start!33466 (=> (not res!183064) (not e!204002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33466 (= res!183064 (validMask!0 mask!2385))))

(assert (=> start!33466 e!204002))

(assert (=> start!33466 true))

(declare-fun e!203999 () Bool)

(declare-fun array_inv!6000 (array!17062) Bool)

(assert (=> start!33466 (and (array_inv!6000 _values!1525) e!203999)))

(declare-fun array_inv!6001 (array!17064) Bool)

(assert (=> start!33466 (array_inv!6001 _keys!1895)))

(declare-fun b!332255 () Bool)

(declare-fun e!203998 () Bool)

(declare-fun tp_is_empty!6733 () Bool)

(assert (=> b!332255 (= e!203998 tp_is_empty!6733)))

(declare-fun b!332256 () Bool)

(declare-fun e!204001 () Bool)

(assert (=> b!332256 (= e!204001 tp_is_empty!6733)))

(declare-fun b!332257 () Bool)

(declare-fun mapRes!11484 () Bool)

(assert (=> b!332257 (= e!203999 (and e!204001 mapRes!11484))))

(declare-fun condMapEmpty!11484 () Bool)

(declare-fun mapDefault!11484 () ValueCell!3023)

(assert (=> b!332257 (= condMapEmpty!11484 (= (arr!8065 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3023)) mapDefault!11484)))))

(declare-fun mapIsEmpty!11484 () Bool)

(assert (=> mapIsEmpty!11484 mapRes!11484))

(declare-fun b!332258 () Bool)

(assert (=> b!332258 (= e!204002 false)))

(declare-fun lt!159013 () Bool)

(declare-datatypes ((List!4503 0))(
  ( (Nil!4500) (Cons!4499 (h!5355 (_ BitVec 64)) (t!9577 List!4503)) )
))
(declare-fun arrayNoDuplicates!0 (array!17064 (_ BitVec 32) List!4503) Bool)

(assert (=> b!332258 (= lt!159013 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4500))))

(declare-fun mapNonEmpty!11484 () Bool)

(declare-fun tp!23859 () Bool)

(assert (=> mapNonEmpty!11484 (= mapRes!11484 (and tp!23859 e!203998))))

(declare-fun mapKey!11484 () (_ BitVec 32))

(declare-fun mapRest!11484 () (Array (_ BitVec 32) ValueCell!3023))

(declare-fun mapValue!11484 () ValueCell!3023)

(assert (=> mapNonEmpty!11484 (= (arr!8065 _values!1525) (store mapRest!11484 mapKey!11484 mapValue!11484))))

(declare-fun b!332259 () Bool)

(declare-fun res!183065 () Bool)

(assert (=> b!332259 (=> (not res!183065) (not e!204002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17064 (_ BitVec 32)) Bool)

(assert (=> b!332259 (= res!183065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33466 res!183064) b!332254))

(assert (= (and b!332254 res!183063) b!332259))

(assert (= (and b!332259 res!183065) b!332258))

(assert (= (and b!332257 condMapEmpty!11484) mapIsEmpty!11484))

(assert (= (and b!332257 (not condMapEmpty!11484)) mapNonEmpty!11484))

(get-info :version)

(assert (= (and mapNonEmpty!11484 ((_ is ValueCellFull!3023) mapValue!11484)) b!332255))

(assert (= (and b!332257 ((_ is ValueCellFull!3023) mapDefault!11484)) b!332256))

(assert (= start!33466 b!332257))

(declare-fun m!337097 () Bool)

(assert (=> start!33466 m!337097))

(declare-fun m!337099 () Bool)

(assert (=> start!33466 m!337099))

(declare-fun m!337101 () Bool)

(assert (=> start!33466 m!337101))

(declare-fun m!337103 () Bool)

(assert (=> b!332258 m!337103))

(declare-fun m!337105 () Bool)

(assert (=> mapNonEmpty!11484 m!337105))

(declare-fun m!337107 () Bool)

(assert (=> b!332259 m!337107))

(check-sat (not start!33466) (not b!332259) (not mapNonEmpty!11484) tp_is_empty!6733 (not b!332258))
(check-sat)
