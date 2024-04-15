; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35998 () Bool)

(assert start!35998)

(declare-fun b!361386 () Bool)

(declare-fun res!201056 () Bool)

(declare-fun e!221332 () Bool)

(assert (=> b!361386 (=> (not res!201056) (not e!221332))))

(declare-fun from!1924 () (_ BitVec 32))

(declare-datatypes ((array!20325 0))(
  ( (array!20326 (arr!9649 (Array (_ BitVec 32) (_ BitVec 64))) (size!10002 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20325)

(assert (=> b!361386 (= res!201056 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10002 _keys!1541))))))

(declare-fun b!361387 () Bool)

(declare-fun e!221330 () Bool)

(declare-fun tp_is_empty!8395 () Bool)

(assert (=> b!361387 (= e!221330 tp_is_empty!8395)))

(declare-fun b!361388 () Bool)

(declare-fun res!201058 () Bool)

(assert (=> b!361388 (=> (not res!201058) (not e!221332))))

(declare-datatypes ((List!5481 0))(
  ( (Nil!5478) (Cons!5477 (h!6333 (_ BitVec 64)) (t!10622 List!5481)) )
))
(declare-fun arrayNoDuplicates!0 (array!20325 (_ BitVec 32) List!5481) Bool)

(assert (=> b!361388 (= res!201058 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5478))))

(declare-fun mapIsEmpty!14121 () Bool)

(declare-fun mapRes!14121 () Bool)

(assert (=> mapIsEmpty!14121 mapRes!14121))

(declare-fun b!361389 () Bool)

(declare-fun k0!1134 () (_ BitVec 64))

(assert (=> b!361389 (= e!221332 (and (not (= (select (arr!9649 _keys!1541) from!1924) k0!1134)) (bvslt (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000)))))

(declare-fun b!361390 () Bool)

(declare-fun e!221328 () Bool)

(assert (=> b!361390 (= e!221328 tp_is_empty!8395)))

(declare-fun b!361391 () Bool)

(declare-fun e!221329 () Bool)

(assert (=> b!361391 (= e!221329 (and e!221328 mapRes!14121))))

(declare-fun condMapEmpty!14121 () Bool)

(declare-datatypes ((V!12171 0))(
  ( (V!12172 (val!4242 Int)) )
))
(declare-datatypes ((ValueCell!3854 0))(
  ( (ValueCellFull!3854 (v!6431 V!12171)) (EmptyCell!3854) )
))
(declare-datatypes ((array!20327 0))(
  ( (array!20328 (arr!9650 (Array (_ BitVec 32) ValueCell!3854)) (size!10003 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20327)

(declare-fun mapDefault!14121 () ValueCell!3854)

(assert (=> b!361391 (= condMapEmpty!14121 (= (arr!9650 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3854)) mapDefault!14121)))))

(declare-fun b!361392 () Bool)

(declare-fun res!201059 () Bool)

(assert (=> b!361392 (=> (not res!201059) (not e!221332))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(assert (=> b!361392 (= res!201059 (and (= (size!10003 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10002 _keys!1541) (size!10003 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun res!201055 () Bool)

(assert (=> start!35998 (=> (not res!201055) (not e!221332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35998 (= res!201055 (validMask!0 mask!1943))))

(assert (=> start!35998 e!221332))

(assert (=> start!35998 true))

(declare-fun array_inv!7110 (array!20325) Bool)

(assert (=> start!35998 (array_inv!7110 _keys!1541)))

(declare-fun array_inv!7111 (array!20327) Bool)

(assert (=> start!35998 (and (array_inv!7111 _values!1277) e!221329)))

(declare-fun b!361393 () Bool)

(declare-fun res!201057 () Bool)

(assert (=> b!361393 (=> (not res!201057) (not e!221332))))

(declare-fun arrayContainsKey!0 (array!20325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361393 (= res!201057 (arrayContainsKey!0 _keys!1541 k0!1134 from!1924))))

(declare-fun b!361394 () Bool)

(declare-fun res!201054 () Bool)

(assert (=> b!361394 (=> (not res!201054) (not e!221332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20325 (_ BitVec 32)) Bool)

(assert (=> b!361394 (= res!201054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun mapNonEmpty!14121 () Bool)

(declare-fun tp!28197 () Bool)

(assert (=> mapNonEmpty!14121 (= mapRes!14121 (and tp!28197 e!221330))))

(declare-fun mapKey!14121 () (_ BitVec 32))

(declare-fun mapRest!14121 () (Array (_ BitVec 32) ValueCell!3854))

(declare-fun mapValue!14121 () ValueCell!3854)

(assert (=> mapNonEmpty!14121 (= (arr!9650 _values!1277) (store mapRest!14121 mapKey!14121 mapValue!14121))))

(assert (= (and start!35998 res!201055) b!361392))

(assert (= (and b!361392 res!201059) b!361394))

(assert (= (and b!361394 res!201054) b!361388))

(assert (= (and b!361388 res!201058) b!361386))

(assert (= (and b!361386 res!201056) b!361393))

(assert (= (and b!361393 res!201057) b!361389))

(assert (= (and b!361391 condMapEmpty!14121) mapIsEmpty!14121))

(assert (= (and b!361391 (not condMapEmpty!14121)) mapNonEmpty!14121))

(get-info :version)

(assert (= (and mapNonEmpty!14121 ((_ is ValueCellFull!3854) mapValue!14121)) b!361387))

(assert (= (and b!361391 ((_ is ValueCellFull!3854) mapDefault!14121)) b!361390))

(assert (= start!35998 b!361391))

(declare-fun m!357669 () Bool)

(assert (=> b!361388 m!357669))

(declare-fun m!357671 () Bool)

(assert (=> start!35998 m!357671))

(declare-fun m!357673 () Bool)

(assert (=> start!35998 m!357673))

(declare-fun m!357675 () Bool)

(assert (=> start!35998 m!357675))

(declare-fun m!357677 () Bool)

(assert (=> mapNonEmpty!14121 m!357677))

(declare-fun m!357679 () Bool)

(assert (=> b!361394 m!357679))

(declare-fun m!357681 () Bool)

(assert (=> b!361389 m!357681))

(declare-fun m!357683 () Bool)

(assert (=> b!361393 m!357683))

(check-sat (not start!35998) (not b!361393) (not mapNonEmpty!14121) (not b!361394) tp_is_empty!8395 (not b!361388))
(check-sat)
