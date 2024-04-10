; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84354 () Bool)

(assert start!84354)

(declare-fun b!986686 () Bool)

(declare-fun e!556392 () Bool)

(declare-fun tp_is_empty!23157 () Bool)

(assert (=> b!986686 (= e!556392 tp_is_empty!23157)))

(declare-fun b!986687 () Bool)

(declare-fun res!660115 () Bool)

(declare-fun e!556388 () Bool)

(assert (=> b!986687 (=> (not res!660115) (not e!556388))))

(declare-datatypes ((V!35859 0))(
  ( (V!35860 (val!11629 Int)) )
))
(declare-datatypes ((ValueCell!11097 0))(
  ( (ValueCellFull!11097 (v!14191 V!35859)) (EmptyCell!11097) )
))
(declare-datatypes ((array!62275 0))(
  ( (array!62276 (arr!29995 (Array (_ BitVec 32) ValueCell!11097)) (size!30474 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62275)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62277 0))(
  ( (array!62278 (arr!29996 (Array (_ BitVec 32) (_ BitVec 64))) (size!30475 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62277)

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!986687 (= res!660115 (and (= (size!30474 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30475 _keys!1544) (size!30474 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986688 () Bool)

(declare-fun res!660114 () Bool)

(assert (=> b!986688 (=> (not res!660114) (not e!556388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62277 (_ BitVec 32)) Bool)

(assert (=> b!986688 (= res!660114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36764 () Bool)

(declare-fun mapRes!36764 () Bool)

(assert (=> mapIsEmpty!36764 mapRes!36764))

(declare-fun mapNonEmpty!36764 () Bool)

(declare-fun tp!69619 () Bool)

(assert (=> mapNonEmpty!36764 (= mapRes!36764 (and tp!69619 e!556392))))

(declare-fun mapKey!36764 () (_ BitVec 32))

(declare-fun mapValue!36764 () ValueCell!11097)

(declare-fun mapRest!36764 () (Array (_ BitVec 32) ValueCell!11097))

(assert (=> mapNonEmpty!36764 (= (arr!29995 _values!1278) (store mapRest!36764 mapKey!36764 mapValue!36764))))

(declare-fun b!986689 () Bool)

(declare-fun e!556389 () Bool)

(declare-fun e!556391 () Bool)

(assert (=> b!986689 (= e!556389 (and e!556391 mapRes!36764))))

(declare-fun condMapEmpty!36764 () Bool)

(declare-fun mapDefault!36764 () ValueCell!11097)

(assert (=> b!986689 (= condMapEmpty!36764 (= (arr!29995 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11097)) mapDefault!36764)))))

(declare-fun b!986690 () Bool)

(assert (=> b!986690 (= e!556391 tp_is_empty!23157)))

(declare-fun b!986691 () Bool)

(assert (=> b!986691 (= e!556388 false)))

(declare-fun lt!437531 () Bool)

(declare-datatypes ((List!20749 0))(
  ( (Nil!20746) (Cons!20745 (h!21907 (_ BitVec 64)) (t!29648 List!20749)) )
))
(declare-fun arrayNoDuplicates!0 (array!62277 (_ BitVec 32) List!20749) Bool)

(assert (=> b!986691 (= lt!437531 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20746))))

(declare-fun res!660116 () Bool)

(assert (=> start!84354 (=> (not res!660116) (not e!556388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84354 (= res!660116 (validMask!0 mask!1948))))

(assert (=> start!84354 e!556388))

(assert (=> start!84354 true))

(declare-fun array_inv!23181 (array!62275) Bool)

(assert (=> start!84354 (and (array_inv!23181 _values!1278) e!556389)))

(declare-fun array_inv!23182 (array!62277) Bool)

(assert (=> start!84354 (array_inv!23182 _keys!1544)))

(assert (= (and start!84354 res!660116) b!986687))

(assert (= (and b!986687 res!660115) b!986688))

(assert (= (and b!986688 res!660114) b!986691))

(assert (= (and b!986689 condMapEmpty!36764) mapIsEmpty!36764))

(assert (= (and b!986689 (not condMapEmpty!36764)) mapNonEmpty!36764))

(get-info :version)

(assert (= (and mapNonEmpty!36764 ((_ is ValueCellFull!11097) mapValue!36764)) b!986686))

(assert (= (and b!986689 ((_ is ValueCellFull!11097) mapDefault!36764)) b!986690))

(assert (= start!84354 b!986689))

(declare-fun m!913435 () Bool)

(assert (=> b!986688 m!913435))

(declare-fun m!913437 () Bool)

(assert (=> mapNonEmpty!36764 m!913437))

(declare-fun m!913439 () Bool)

(assert (=> b!986691 m!913439))

(declare-fun m!913441 () Bool)

(assert (=> start!84354 m!913441))

(declare-fun m!913443 () Bool)

(assert (=> start!84354 m!913443))

(declare-fun m!913445 () Bool)

(assert (=> start!84354 m!913445))

(check-sat (not mapNonEmpty!36764) (not b!986691) (not start!84354) (not b!986688) tp_is_empty!23157)
(check-sat)
