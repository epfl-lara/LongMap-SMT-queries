; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33460 () Bool)

(assert start!33460)

(declare-fun res!183036 () Bool)

(declare-fun e!203955 () Bool)

(assert (=> start!33460 (=> (not res!183036) (not e!203955))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33460 (= res!183036 (validMask!0 mask!2385))))

(assert (=> start!33460 e!203955))

(assert (=> start!33460 true))

(declare-datatypes ((V!9947 0))(
  ( (V!9948 (val!3408 Int)) )
))
(declare-datatypes ((ValueCell!3020 0))(
  ( (ValueCellFull!3020 (v!5568 V!9947)) (EmptyCell!3020) )
))
(declare-datatypes ((array!17050 0))(
  ( (array!17051 (arr!8059 (Array (_ BitVec 32) ValueCell!3020)) (size!8411 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17050)

(declare-fun e!203957 () Bool)

(declare-fun array_inv!5994 (array!17050) Bool)

(assert (=> start!33460 (and (array_inv!5994 _values!1525) e!203957)))

(declare-datatypes ((array!17052 0))(
  ( (array!17053 (arr!8060 (Array (_ BitVec 32) (_ BitVec 64))) (size!8412 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17052)

(declare-fun array_inv!5995 (array!17052) Bool)

(assert (=> start!33460 (array_inv!5995 _keys!1895)))

(declare-fun mapIsEmpty!11475 () Bool)

(declare-fun mapRes!11475 () Bool)

(assert (=> mapIsEmpty!11475 mapRes!11475))

(declare-fun b!332200 () Bool)

(declare-fun e!203953 () Bool)

(declare-fun tp_is_empty!6727 () Bool)

(assert (=> b!332200 (= e!203953 tp_is_empty!6727)))

(declare-fun b!332201 () Bool)

(declare-fun res!183038 () Bool)

(assert (=> b!332201 (=> (not res!183038) (not e!203955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17052 (_ BitVec 32)) Bool)

(assert (=> b!332201 (= res!183038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332202 () Bool)

(declare-fun e!203954 () Bool)

(assert (=> b!332202 (= e!203957 (and e!203954 mapRes!11475))))

(declare-fun condMapEmpty!11475 () Bool)

(declare-fun mapDefault!11475 () ValueCell!3020)

(assert (=> b!332202 (= condMapEmpty!11475 (= (arr!8059 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3020)) mapDefault!11475)))))

(declare-fun b!332203 () Bool)

(assert (=> b!332203 (= e!203954 tp_is_empty!6727)))

(declare-fun b!332204 () Bool)

(assert (=> b!332204 (= e!203955 false)))

(declare-fun lt!159004 () Bool)

(declare-datatypes ((List!4501 0))(
  ( (Nil!4498) (Cons!4497 (h!5353 (_ BitVec 64)) (t!9575 List!4501)) )
))
(declare-fun arrayNoDuplicates!0 (array!17052 (_ BitVec 32) List!4501) Bool)

(assert (=> b!332204 (= lt!159004 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4498))))

(declare-fun b!332205 () Bool)

(declare-fun res!183037 () Bool)

(assert (=> b!332205 (=> (not res!183037) (not e!203955))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332205 (= res!183037 (and (= (size!8411 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8412 _keys!1895) (size!8411 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11475 () Bool)

(declare-fun tp!23850 () Bool)

(assert (=> mapNonEmpty!11475 (= mapRes!11475 (and tp!23850 e!203953))))

(declare-fun mapValue!11475 () ValueCell!3020)

(declare-fun mapKey!11475 () (_ BitVec 32))

(declare-fun mapRest!11475 () (Array (_ BitVec 32) ValueCell!3020))

(assert (=> mapNonEmpty!11475 (= (arr!8059 _values!1525) (store mapRest!11475 mapKey!11475 mapValue!11475))))

(assert (= (and start!33460 res!183036) b!332205))

(assert (= (and b!332205 res!183037) b!332201))

(assert (= (and b!332201 res!183038) b!332204))

(assert (= (and b!332202 condMapEmpty!11475) mapIsEmpty!11475))

(assert (= (and b!332202 (not condMapEmpty!11475)) mapNonEmpty!11475))

(get-info :version)

(assert (= (and mapNonEmpty!11475 ((_ is ValueCellFull!3020) mapValue!11475)) b!332200))

(assert (= (and b!332202 ((_ is ValueCellFull!3020) mapDefault!11475)) b!332203))

(assert (= start!33460 b!332202))

(declare-fun m!337061 () Bool)

(assert (=> start!33460 m!337061))

(declare-fun m!337063 () Bool)

(assert (=> start!33460 m!337063))

(declare-fun m!337065 () Bool)

(assert (=> start!33460 m!337065))

(declare-fun m!337067 () Bool)

(assert (=> b!332201 m!337067))

(declare-fun m!337069 () Bool)

(assert (=> b!332204 m!337069))

(declare-fun m!337071 () Bool)

(assert (=> mapNonEmpty!11475 m!337071))

(check-sat (not b!332204) (not mapNonEmpty!11475) (not start!33460) (not b!332201) tp_is_empty!6727)
(check-sat)
