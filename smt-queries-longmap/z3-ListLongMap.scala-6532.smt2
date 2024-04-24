; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83244 () Bool)

(assert start!83244)

(declare-fun b!970031 () Bool)

(declare-fun e!546901 () Bool)

(declare-fun tp_is_empty!21967 () Bool)

(assert (=> b!970031 (= e!546901 tp_is_empty!21967)))

(declare-fun b!970032 () Bool)

(declare-fun e!546898 () Bool)

(declare-fun e!546900 () Bool)

(declare-fun mapRes!34960 () Bool)

(assert (=> b!970032 (= e!546898 (and e!546900 mapRes!34960))))

(declare-fun condMapEmpty!34960 () Bool)

(declare-datatypes ((V!34273 0))(
  ( (V!34274 (val!11034 Int)) )
))
(declare-datatypes ((ValueCell!10502 0))(
  ( (ValueCellFull!10502 (v!13590 V!34273)) (EmptyCell!10502) )
))
(declare-datatypes ((array!60018 0))(
  ( (array!60019 (arr!28868 (Array (_ BitVec 32) ValueCell!10502)) (size!29348 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60018)

(declare-fun mapDefault!34960 () ValueCell!10502)

(assert (=> b!970032 (= condMapEmpty!34960 (= (arr!28868 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10502)) mapDefault!34960)))))

(declare-fun mapIsEmpty!34960 () Bool)

(assert (=> mapIsEmpty!34960 mapRes!34960))

(declare-fun b!970034 () Bool)

(declare-fun res!649029 () Bool)

(declare-fun e!546899 () Bool)

(assert (=> b!970034 (=> (not res!649029) (not e!546899))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60020 0))(
  ( (array!60021 (arr!28869 (Array (_ BitVec 32) (_ BitVec 64))) (size!29349 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60020)

(assert (=> b!970034 (= res!649029 (and (= (size!29348 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29349 _keys!1717) (size!29348 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970035 () Bool)

(declare-fun res!649031 () Bool)

(assert (=> b!970035 (=> (not res!649031) (not e!546899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60020 (_ BitVec 32)) Bool)

(assert (=> b!970035 (= res!649031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!34960 () Bool)

(declare-fun tp!66529 () Bool)

(assert (=> mapNonEmpty!34960 (= mapRes!34960 (and tp!66529 e!546901))))

(declare-fun mapRest!34960 () (Array (_ BitVec 32) ValueCell!10502))

(declare-fun mapValue!34960 () ValueCell!10502)

(declare-fun mapKey!34960 () (_ BitVec 32))

(assert (=> mapNonEmpty!34960 (= (arr!28868 _values!1425) (store mapRest!34960 mapKey!34960 mapValue!34960))))

(declare-fun b!970036 () Bool)

(assert (=> b!970036 (= e!546899 false)))

(declare-fun lt!431961 () Bool)

(declare-datatypes ((List!20007 0))(
  ( (Nil!20004) (Cons!20003 (h!21171 (_ BitVec 64)) (t!28362 List!20007)) )
))
(declare-fun arrayNoDuplicates!0 (array!60020 (_ BitVec 32) List!20007) Bool)

(assert (=> b!970036 (= lt!431961 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20004))))

(declare-fun b!970033 () Bool)

(assert (=> b!970033 (= e!546900 tp_is_empty!21967)))

(declare-fun res!649030 () Bool)

(assert (=> start!83244 (=> (not res!649030) (not e!546899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83244 (= res!649030 (validMask!0 mask!2147))))

(assert (=> start!83244 e!546899))

(assert (=> start!83244 true))

(declare-fun array_inv!22403 (array!60018) Bool)

(assert (=> start!83244 (and (array_inv!22403 _values!1425) e!546898)))

(declare-fun array_inv!22404 (array!60020) Bool)

(assert (=> start!83244 (array_inv!22404 _keys!1717)))

(assert (= (and start!83244 res!649030) b!970034))

(assert (= (and b!970034 res!649029) b!970035))

(assert (= (and b!970035 res!649031) b!970036))

(assert (= (and b!970032 condMapEmpty!34960) mapIsEmpty!34960))

(assert (= (and b!970032 (not condMapEmpty!34960)) mapNonEmpty!34960))

(get-info :version)

(assert (= (and mapNonEmpty!34960 ((_ is ValueCellFull!10502) mapValue!34960)) b!970031))

(assert (= (and b!970032 ((_ is ValueCellFull!10502) mapDefault!34960)) b!970033))

(assert (= start!83244 b!970032))

(declare-fun m!898529 () Bool)

(assert (=> b!970035 m!898529))

(declare-fun m!898531 () Bool)

(assert (=> mapNonEmpty!34960 m!898531))

(declare-fun m!898533 () Bool)

(assert (=> b!970036 m!898533))

(declare-fun m!898535 () Bool)

(assert (=> start!83244 m!898535))

(declare-fun m!898537 () Bool)

(assert (=> start!83244 m!898537))

(declare-fun m!898539 () Bool)

(assert (=> start!83244 m!898539))

(check-sat tp_is_empty!21967 (not b!970035) (not mapNonEmpty!34960) (not start!83244) (not b!970036))
(check-sat)
