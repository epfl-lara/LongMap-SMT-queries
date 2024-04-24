; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35998 () Bool)

(assert start!35998)

(declare-fun b!361608 () Bool)

(declare-fun res!201183 () Bool)

(declare-fun e!221474 () Bool)

(assert (=> b!361608 (=> (not res!201183) (not e!221474))))

(declare-datatypes ((array!20330 0))(
  ( (array!20331 (arr!9651 (Array (_ BitVec 32) (_ BitVec 64))) (size!10003 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20330)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20330 (_ BitVec 32)) Bool)

(assert (=> b!361608 (= res!201183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361609 () Bool)

(declare-fun res!201180 () Bool)

(assert (=> b!361609 (=> (not res!201180) (not e!221474))))

(declare-datatypes ((List!5425 0))(
  ( (Nil!5422) (Cons!5421 (h!6277 (_ BitVec 64)) (t!10567 List!5425)) )
))
(declare-fun arrayNoDuplicates!0 (array!20330 (_ BitVec 32) List!5425) Bool)

(assert (=> b!361609 (= res!201180 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5422))))

(declare-fun b!361610 () Bool)

(declare-fun e!221473 () Bool)

(declare-fun tp_is_empty!8395 () Bool)

(assert (=> b!361610 (= e!221473 tp_is_empty!8395)))

(declare-fun mapIsEmpty!14121 () Bool)

(declare-fun mapRes!14121 () Bool)

(assert (=> mapIsEmpty!14121 mapRes!14121))

(declare-fun b!361611 () Bool)

(declare-fun res!201185 () Bool)

(assert (=> b!361611 (=> (not res!201185) (not e!221474))))

(declare-fun from!1924 () (_ BitVec 32))

(declare-fun k0!1134 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361611 (= res!201185 (arrayContainsKey!0 _keys!1541 k0!1134 from!1924))))

(declare-fun b!361612 () Bool)

(declare-fun e!221471 () Bool)

(declare-fun e!221472 () Bool)

(assert (=> b!361612 (= e!221471 (and e!221472 mapRes!14121))))

(declare-fun condMapEmpty!14121 () Bool)

(declare-datatypes ((V!12171 0))(
  ( (V!12172 (val!4242 Int)) )
))
(declare-datatypes ((ValueCell!3854 0))(
  ( (ValueCellFull!3854 (v!6438 V!12171)) (EmptyCell!3854) )
))
(declare-datatypes ((array!20332 0))(
  ( (array!20333 (arr!9652 (Array (_ BitVec 32) ValueCell!3854)) (size!10004 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20332)

(declare-fun mapDefault!14121 () ValueCell!3854)

(assert (=> b!361612 (= condMapEmpty!14121 (= (arr!9652 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3854)) mapDefault!14121)))))

(declare-fun b!361613 () Bool)

(declare-fun res!201182 () Bool)

(assert (=> b!361613 (=> (not res!201182) (not e!221474))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(assert (=> b!361613 (= res!201182 (and (= (size!10004 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10003 _keys!1541) (size!10004 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun res!201184 () Bool)

(assert (=> start!35998 (=> (not res!201184) (not e!221474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35998 (= res!201184 (validMask!0 mask!1943))))

(assert (=> start!35998 e!221474))

(assert (=> start!35998 true))

(declare-fun array_inv!7130 (array!20330) Bool)

(assert (=> start!35998 (array_inv!7130 _keys!1541)))

(declare-fun array_inv!7131 (array!20332) Bool)

(assert (=> start!35998 (and (array_inv!7131 _values!1277) e!221471)))

(declare-fun b!361614 () Bool)

(declare-fun res!201181 () Bool)

(assert (=> b!361614 (=> (not res!201181) (not e!221474))))

(assert (=> b!361614 (= res!201181 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10003 _keys!1541))))))

(declare-fun mapNonEmpty!14121 () Bool)

(declare-fun tp!28197 () Bool)

(assert (=> mapNonEmpty!14121 (= mapRes!14121 (and tp!28197 e!221473))))

(declare-fun mapValue!14121 () ValueCell!3854)

(declare-fun mapRest!14121 () (Array (_ BitVec 32) ValueCell!3854))

(declare-fun mapKey!14121 () (_ BitVec 32))

(assert (=> mapNonEmpty!14121 (= (arr!9652 _values!1277) (store mapRest!14121 mapKey!14121 mapValue!14121))))

(declare-fun b!361615 () Bool)

(assert (=> b!361615 (= e!221474 (and (not (= (select (arr!9651 _keys!1541) from!1924) k0!1134)) (bvslt (bvadd #b00000000000000000000000000000001 from!1924) #b00000000000000000000000000000000)))))

(declare-fun b!361616 () Bool)

(assert (=> b!361616 (= e!221472 tp_is_empty!8395)))

(assert (= (and start!35998 res!201184) b!361613))

(assert (= (and b!361613 res!201182) b!361608))

(assert (= (and b!361608 res!201183) b!361609))

(assert (= (and b!361609 res!201180) b!361614))

(assert (= (and b!361614 res!201181) b!361611))

(assert (= (and b!361611 res!201185) b!361615))

(assert (= (and b!361612 condMapEmpty!14121) mapIsEmpty!14121))

(assert (= (and b!361612 (not condMapEmpty!14121)) mapNonEmpty!14121))

(get-info :version)

(assert (= (and mapNonEmpty!14121 ((_ is ValueCellFull!3854) mapValue!14121)) b!361610))

(assert (= (and b!361612 ((_ is ValueCellFull!3854) mapDefault!14121)) b!361616))

(assert (= start!35998 b!361612))

(declare-fun m!358623 () Bool)

(assert (=> b!361611 m!358623))

(declare-fun m!358625 () Bool)

(assert (=> b!361609 m!358625))

(declare-fun m!358627 () Bool)

(assert (=> start!35998 m!358627))

(declare-fun m!358629 () Bool)

(assert (=> start!35998 m!358629))

(declare-fun m!358631 () Bool)

(assert (=> start!35998 m!358631))

(declare-fun m!358633 () Bool)

(assert (=> mapNonEmpty!14121 m!358633))

(declare-fun m!358635 () Bool)

(assert (=> b!361615 m!358635))

(declare-fun m!358637 () Bool)

(assert (=> b!361608 m!358637))

(check-sat tp_is_empty!8395 (not b!361611) (not b!361609) (not start!35998) (not mapNonEmpty!14121) (not b!361608))
(check-sat)
