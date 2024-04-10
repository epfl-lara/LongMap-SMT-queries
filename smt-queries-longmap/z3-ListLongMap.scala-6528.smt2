; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83054 () Bool)

(assert start!83054)

(declare-fun b!968930 () Bool)

(declare-fun res!648588 () Bool)

(declare-fun e!546150 () Bool)

(assert (=> b!968930 (=> (not res!648588) (not e!546150))))

(declare-datatypes ((array!59963 0))(
  ( (array!59964 (arr!28845 (Array (_ BitVec 32) (_ BitVec 64))) (size!29324 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59963)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59963 (_ BitVec 32)) Bool)

(assert (=> b!968930 (= res!648588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!648586 () Bool)

(assert (=> start!83054 (=> (not res!648586) (not e!546150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83054 (= res!648586 (validMask!0 mask!2147))))

(assert (=> start!83054 e!546150))

(assert (=> start!83054 true))

(declare-datatypes ((V!34243 0))(
  ( (V!34244 (val!11023 Int)) )
))
(declare-datatypes ((ValueCell!10491 0))(
  ( (ValueCellFull!10491 (v!13582 V!34243)) (EmptyCell!10491) )
))
(declare-datatypes ((array!59965 0))(
  ( (array!59966 (arr!28846 (Array (_ BitVec 32) ValueCell!10491)) (size!29325 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59965)

(declare-fun e!546152 () Bool)

(declare-fun array_inv!22329 (array!59965) Bool)

(assert (=> start!83054 (and (array_inv!22329 _values!1425) e!546152)))

(declare-fun array_inv!22330 (array!59963) Bool)

(assert (=> start!83054 (array_inv!22330 _keys!1717)))

(declare-fun b!968931 () Bool)

(declare-fun e!546153 () Bool)

(declare-fun tp_is_empty!21945 () Bool)

(assert (=> b!968931 (= e!546153 tp_is_empty!21945)))

(declare-fun b!968932 () Bool)

(assert (=> b!968932 (= e!546150 false)))

(declare-fun lt!431567 () Bool)

(declare-datatypes ((List!20007 0))(
  ( (Nil!20004) (Cons!20003 (h!21165 (_ BitVec 64)) (t!28370 List!20007)) )
))
(declare-fun arrayNoDuplicates!0 (array!59963 (_ BitVec 32) List!20007) Bool)

(assert (=> b!968932 (= lt!431567 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20004))))

(declare-fun b!968933 () Bool)

(declare-fun e!546151 () Bool)

(declare-fun mapRes!34927 () Bool)

(assert (=> b!968933 (= e!546152 (and e!546151 mapRes!34927))))

(declare-fun condMapEmpty!34927 () Bool)

(declare-fun mapDefault!34927 () ValueCell!10491)

(assert (=> b!968933 (= condMapEmpty!34927 (= (arr!28846 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10491)) mapDefault!34927)))))

(declare-fun mapNonEmpty!34927 () Bool)

(declare-fun tp!66495 () Bool)

(assert (=> mapNonEmpty!34927 (= mapRes!34927 (and tp!66495 e!546153))))

(declare-fun mapKey!34927 () (_ BitVec 32))

(declare-fun mapValue!34927 () ValueCell!10491)

(declare-fun mapRest!34927 () (Array (_ BitVec 32) ValueCell!10491))

(assert (=> mapNonEmpty!34927 (= (arr!28846 _values!1425) (store mapRest!34927 mapKey!34927 mapValue!34927))))

(declare-fun b!968934 () Bool)

(assert (=> b!968934 (= e!546151 tp_is_empty!21945)))

(declare-fun mapIsEmpty!34927 () Bool)

(assert (=> mapIsEmpty!34927 mapRes!34927))

(declare-fun b!968935 () Bool)

(declare-fun res!648587 () Bool)

(assert (=> b!968935 (=> (not res!648587) (not e!546150))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968935 (= res!648587 (and (= (size!29325 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29324 _keys!1717) (size!29325 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83054 res!648586) b!968935))

(assert (= (and b!968935 res!648587) b!968930))

(assert (= (and b!968930 res!648588) b!968932))

(assert (= (and b!968933 condMapEmpty!34927) mapIsEmpty!34927))

(assert (= (and b!968933 (not condMapEmpty!34927)) mapNonEmpty!34927))

(get-info :version)

(assert (= (and mapNonEmpty!34927 ((_ is ValueCellFull!10491) mapValue!34927)) b!968931))

(assert (= (and b!968933 ((_ is ValueCellFull!10491) mapDefault!34927)) b!968934))

(assert (= start!83054 b!968933))

(declare-fun m!897103 () Bool)

(assert (=> b!968930 m!897103))

(declare-fun m!897105 () Bool)

(assert (=> start!83054 m!897105))

(declare-fun m!897107 () Bool)

(assert (=> start!83054 m!897107))

(declare-fun m!897109 () Bool)

(assert (=> start!83054 m!897109))

(declare-fun m!897111 () Bool)

(assert (=> b!968932 m!897111))

(declare-fun m!897113 () Bool)

(assert (=> mapNonEmpty!34927 m!897113))

(check-sat (not b!968932) (not b!968930) tp_is_empty!21945 (not mapNonEmpty!34927) (not start!83054))
(check-sat)
