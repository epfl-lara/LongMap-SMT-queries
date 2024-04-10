; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41274 () Bool)

(assert start!41274)

(declare-fun mapNonEmpty!20308 () Bool)

(declare-fun mapRes!20308 () Bool)

(declare-fun tp!39127 () Bool)

(declare-fun e!269330 () Bool)

(assert (=> mapNonEmpty!20308 (= mapRes!20308 (and tp!39127 e!269330))))

(declare-datatypes ((V!17685 0))(
  ( (V!17686 (val!6262 Int)) )
))
(declare-datatypes ((ValueCell!5874 0))(
  ( (ValueCellFull!5874 (v!8548 V!17685)) (EmptyCell!5874) )
))
(declare-fun mapRest!20308 () (Array (_ BitVec 32) ValueCell!5874))

(declare-fun mapValue!20308 () ValueCell!5874)

(declare-fun mapKey!20308 () (_ BitVec 32))

(declare-datatypes ((array!28671 0))(
  ( (array!28672 (arr!13774 (Array (_ BitVec 32) ValueCell!5874)) (size!14126 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28671)

(assert (=> mapNonEmpty!20308 (= (arr!13774 _values!833) (store mapRest!20308 mapKey!20308 mapValue!20308))))

(declare-fun b!461815 () Bool)

(declare-fun e!269332 () Bool)

(declare-fun tp_is_empty!12435 () Bool)

(assert (=> b!461815 (= e!269332 tp_is_empty!12435)))

(declare-fun b!461816 () Bool)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun e!269331 () Bool)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28673 0))(
  ( (array!28674 (arr!13775 (Array (_ BitVec 32) (_ BitVec 64))) (size!14127 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28673)

(assert (=> b!461816 (= e!269331 (and (= (size!14126 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14127 _keys!1025) (size!14126 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (size!14127 _keys!1025) (bvadd #b00000000000000000000000000000001 mask!1365)))))))

(declare-fun res!276258 () Bool)

(assert (=> start!41274 (=> (not res!276258) (not e!269331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41274 (= res!276258 (validMask!0 mask!1365))))

(assert (=> start!41274 e!269331))

(assert (=> start!41274 true))

(declare-fun array_inv!9964 (array!28673) Bool)

(assert (=> start!41274 (array_inv!9964 _keys!1025)))

(declare-fun e!269329 () Bool)

(declare-fun array_inv!9965 (array!28671) Bool)

(assert (=> start!41274 (and (array_inv!9965 _values!833) e!269329)))

(declare-fun mapIsEmpty!20308 () Bool)

(assert (=> mapIsEmpty!20308 mapRes!20308))

(declare-fun b!461817 () Bool)

(assert (=> b!461817 (= e!269329 (and e!269332 mapRes!20308))))

(declare-fun condMapEmpty!20308 () Bool)

(declare-fun mapDefault!20308 () ValueCell!5874)

(assert (=> b!461817 (= condMapEmpty!20308 (= (arr!13774 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5874)) mapDefault!20308)))))

(declare-fun b!461818 () Bool)

(assert (=> b!461818 (= e!269330 tp_is_empty!12435)))

(assert (= (and start!41274 res!276258) b!461816))

(assert (= (and b!461817 condMapEmpty!20308) mapIsEmpty!20308))

(assert (= (and b!461817 (not condMapEmpty!20308)) mapNonEmpty!20308))

(get-info :version)

(assert (= (and mapNonEmpty!20308 ((_ is ValueCellFull!5874) mapValue!20308)) b!461818))

(assert (= (and b!461817 ((_ is ValueCellFull!5874) mapDefault!20308)) b!461815))

(assert (= start!41274 b!461817))

(declare-fun m!444985 () Bool)

(assert (=> mapNonEmpty!20308 m!444985))

(declare-fun m!444987 () Bool)

(assert (=> start!41274 m!444987))

(declare-fun m!444989 () Bool)

(assert (=> start!41274 m!444989))

(declare-fun m!444991 () Bool)

(assert (=> start!41274 m!444991))

(check-sat (not start!41274) (not mapNonEmpty!20308) tp_is_empty!12435)
(check-sat)
