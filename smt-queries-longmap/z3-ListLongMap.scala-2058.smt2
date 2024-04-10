; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35518 () Bool)

(assert start!35518)

(declare-fun b!355934 () Bool)

(declare-fun e!218080 () Bool)

(assert (=> b!355934 (= e!218080 false)))

(declare-fun lt!165872 () Bool)

(declare-datatypes ((array!19519 0))(
  ( (array!19520 (arr!9253 (Array (_ BitVec 32) (_ BitVec 64))) (size!9605 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19519)

(declare-datatypes ((List!5354 0))(
  ( (Nil!5351) (Cons!5350 (h!6206 (_ BitVec 64)) (t!10504 List!5354)) )
))
(declare-fun arrayNoDuplicates!0 (array!19519 (_ BitVec 32) List!5354) Bool)

(assert (=> b!355934 (= lt!165872 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5351))))

(declare-fun b!355935 () Bool)

(declare-fun e!218077 () Bool)

(declare-fun tp_is_empty!7971 () Bool)

(assert (=> b!355935 (= e!218077 tp_is_empty!7971)))

(declare-fun b!355936 () Bool)

(declare-fun res!197468 () Bool)

(assert (=> b!355936 (=> (not res!197468) (not e!218080))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((V!11605 0))(
  ( (V!11606 (val!4030 Int)) )
))
(declare-datatypes ((ValueCell!3642 0))(
  ( (ValueCellFull!3642 (v!6224 V!11605)) (EmptyCell!3642) )
))
(declare-datatypes ((array!19521 0))(
  ( (array!19522 (arr!9254 (Array (_ BitVec 32) ValueCell!3642)) (size!9606 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19521)

(assert (=> b!355936 (= res!197468 (and (= (size!9606 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9605 _keys!1456) (size!9606 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355937 () Bool)

(declare-fun e!218079 () Bool)

(assert (=> b!355937 (= e!218079 tp_is_empty!7971)))

(declare-fun mapIsEmpty!13464 () Bool)

(declare-fun mapRes!13464 () Bool)

(assert (=> mapIsEmpty!13464 mapRes!13464))

(declare-fun res!197469 () Bool)

(assert (=> start!35518 (=> (not res!197469) (not e!218080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35518 (= res!197469 (validMask!0 mask!1842))))

(assert (=> start!35518 e!218080))

(assert (=> start!35518 true))

(declare-fun e!218078 () Bool)

(declare-fun array_inv!6802 (array!19521) Bool)

(assert (=> start!35518 (and (array_inv!6802 _values!1208) e!218078)))

(declare-fun array_inv!6803 (array!19519) Bool)

(assert (=> start!35518 (array_inv!6803 _keys!1456)))

(declare-fun b!355938 () Bool)

(declare-fun res!197470 () Bool)

(assert (=> b!355938 (=> (not res!197470) (not e!218080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19519 (_ BitVec 32)) Bool)

(assert (=> b!355938 (= res!197470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355939 () Bool)

(assert (=> b!355939 (= e!218078 (and e!218079 mapRes!13464))))

(declare-fun condMapEmpty!13464 () Bool)

(declare-fun mapDefault!13464 () ValueCell!3642)

(assert (=> b!355939 (= condMapEmpty!13464 (= (arr!9254 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3642)) mapDefault!13464)))))

(declare-fun mapNonEmpty!13464 () Bool)

(declare-fun tp!27441 () Bool)

(assert (=> mapNonEmpty!13464 (= mapRes!13464 (and tp!27441 e!218077))))

(declare-fun mapRest!13464 () (Array (_ BitVec 32) ValueCell!3642))

(declare-fun mapKey!13464 () (_ BitVec 32))

(declare-fun mapValue!13464 () ValueCell!3642)

(assert (=> mapNonEmpty!13464 (= (arr!9254 _values!1208) (store mapRest!13464 mapKey!13464 mapValue!13464))))

(assert (= (and start!35518 res!197469) b!355936))

(assert (= (and b!355936 res!197468) b!355938))

(assert (= (and b!355938 res!197470) b!355934))

(assert (= (and b!355939 condMapEmpty!13464) mapIsEmpty!13464))

(assert (= (and b!355939 (not condMapEmpty!13464)) mapNonEmpty!13464))

(get-info :version)

(assert (= (and mapNonEmpty!13464 ((_ is ValueCellFull!3642) mapValue!13464)) b!355935))

(assert (= (and b!355939 ((_ is ValueCellFull!3642) mapDefault!13464)) b!355937))

(assert (= start!35518 b!355939))

(declare-fun m!354505 () Bool)

(assert (=> b!355934 m!354505))

(declare-fun m!354507 () Bool)

(assert (=> start!35518 m!354507))

(declare-fun m!354509 () Bool)

(assert (=> start!35518 m!354509))

(declare-fun m!354511 () Bool)

(assert (=> start!35518 m!354511))

(declare-fun m!354513 () Bool)

(assert (=> b!355938 m!354513))

(declare-fun m!354515 () Bool)

(assert (=> mapNonEmpty!13464 m!354515))

(check-sat tp_is_empty!7971 (not mapNonEmpty!13464) (not b!355934) (not start!35518) (not b!355938))
(check-sat)
