; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77636 () Bool)

(assert start!77636)

(declare-fun b!903697 () Bool)

(declare-fun e!506278 () Bool)

(assert (=> b!903697 (= e!506278 false)))

(declare-fun lt!408277 () Bool)

(declare-datatypes ((array!53059 0))(
  ( (array!53060 (arr!25485 (Array (_ BitVec 32) (_ BitVec 64))) (size!25945 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53059)

(declare-datatypes ((List!17853 0))(
  ( (Nil!17850) (Cons!17849 (h!19001 (_ BitVec 64)) (t!25228 List!17853)) )
))
(declare-fun arrayNoDuplicates!0 (array!53059 (_ BitVec 32) List!17853) Bool)

(assert (=> b!903697 (= lt!408277 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17850))))

(declare-fun b!903698 () Bool)

(declare-fun e!506279 () Bool)

(declare-fun tp_is_empty!18481 () Bool)

(assert (=> b!903698 (= e!506279 tp_is_empty!18481)))

(declare-fun mapIsEmpty!29431 () Bool)

(declare-fun mapRes!29431 () Bool)

(assert (=> mapIsEmpty!29431 mapRes!29431))

(declare-fun mapNonEmpty!29431 () Bool)

(declare-fun tp!56491 () Bool)

(declare-fun e!506276 () Bool)

(assert (=> mapNonEmpty!29431 (= mapRes!29431 (and tp!56491 e!506276))))

(declare-datatypes ((V!29607 0))(
  ( (V!29608 (val!9291 Int)) )
))
(declare-datatypes ((ValueCell!8759 0))(
  ( (ValueCellFull!8759 (v!11793 V!29607)) (EmptyCell!8759) )
))
(declare-datatypes ((array!53061 0))(
  ( (array!53062 (arr!25486 (Array (_ BitVec 32) ValueCell!8759)) (size!25946 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53061)

(declare-fun mapRest!29431 () (Array (_ BitVec 32) ValueCell!8759))

(declare-fun mapValue!29431 () ValueCell!8759)

(declare-fun mapKey!29431 () (_ BitVec 32))

(assert (=> mapNonEmpty!29431 (= (arr!25486 _values!1152) (store mapRest!29431 mapKey!29431 mapValue!29431))))

(declare-fun b!903699 () Bool)

(declare-fun e!506277 () Bool)

(assert (=> b!903699 (= e!506277 (and e!506279 mapRes!29431))))

(declare-fun condMapEmpty!29431 () Bool)

(declare-fun mapDefault!29431 () ValueCell!8759)

(assert (=> b!903699 (= condMapEmpty!29431 (= (arr!25486 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8759)) mapDefault!29431)))))

(declare-fun b!903700 () Bool)

(declare-fun res!609536 () Bool)

(assert (=> b!903700 (=> (not res!609536) (not e!506278))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!903700 (= res!609536 (and (= (size!25946 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25945 _keys!1386) (size!25946 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903701 () Bool)

(declare-fun res!609537 () Bool)

(assert (=> b!903701 (=> (not res!609537) (not e!506278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53059 (_ BitVec 32)) Bool)

(assert (=> b!903701 (= res!609537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903702 () Bool)

(assert (=> b!903702 (= e!506276 tp_is_empty!18481)))

(declare-fun res!609538 () Bool)

(assert (=> start!77636 (=> (not res!609538) (not e!506278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77636 (= res!609538 (validMask!0 mask!1756))))

(assert (=> start!77636 e!506278))

(assert (=> start!77636 true))

(declare-fun array_inv!20038 (array!53061) Bool)

(assert (=> start!77636 (and (array_inv!20038 _values!1152) e!506277)))

(declare-fun array_inv!20039 (array!53059) Bool)

(assert (=> start!77636 (array_inv!20039 _keys!1386)))

(assert (= (and start!77636 res!609538) b!903700))

(assert (= (and b!903700 res!609536) b!903701))

(assert (= (and b!903701 res!609537) b!903697))

(assert (= (and b!903699 condMapEmpty!29431) mapIsEmpty!29431))

(assert (= (and b!903699 (not condMapEmpty!29431)) mapNonEmpty!29431))

(get-info :version)

(assert (= (and mapNonEmpty!29431 ((_ is ValueCellFull!8759) mapValue!29431)) b!903702))

(assert (= (and b!903699 ((_ is ValueCellFull!8759) mapDefault!29431)) b!903698))

(assert (= start!77636 b!903699))

(declare-fun m!839969 () Bool)

(assert (=> b!903697 m!839969))

(declare-fun m!839971 () Bool)

(assert (=> mapNonEmpty!29431 m!839971))

(declare-fun m!839973 () Bool)

(assert (=> b!903701 m!839973))

(declare-fun m!839975 () Bool)

(assert (=> start!77636 m!839975))

(declare-fun m!839977 () Bool)

(assert (=> start!77636 m!839977))

(declare-fun m!839979 () Bool)

(assert (=> start!77636 m!839979))

(check-sat (not start!77636) (not mapNonEmpty!29431) (not b!903701) (not b!903697) tp_is_empty!18481)
(check-sat)
