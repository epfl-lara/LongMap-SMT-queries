; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33466 () Bool)

(assert start!33466)

(declare-fun b!332032 () Bool)

(declare-fun e!203860 () Bool)

(assert (=> b!332032 (= e!203860 false)))

(declare-fun lt!158760 () Bool)

(declare-datatypes ((array!17047 0))(
  ( (array!17048 (arr!8058 (Array (_ BitVec 32) (_ BitVec 64))) (size!8411 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17047)

(declare-datatypes ((List!4557 0))(
  ( (Nil!4554) (Cons!4553 (h!5409 (_ BitVec 64)) (t!9630 List!4557)) )
))
(declare-fun arrayNoDuplicates!0 (array!17047 (_ BitVec 32) List!4557) Bool)

(assert (=> b!332032 (= lt!158760 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4554))))

(declare-fun b!332033 () Bool)

(declare-fun e!203857 () Bool)

(declare-fun e!203856 () Bool)

(declare-fun mapRes!11484 () Bool)

(assert (=> b!332033 (= e!203857 (and e!203856 mapRes!11484))))

(declare-fun condMapEmpty!11484 () Bool)

(declare-datatypes ((V!9955 0))(
  ( (V!9956 (val!3411 Int)) )
))
(declare-datatypes ((ValueCell!3023 0))(
  ( (ValueCellFull!3023 (v!5564 V!9955)) (EmptyCell!3023) )
))
(declare-datatypes ((array!17049 0))(
  ( (array!17050 (arr!8059 (Array (_ BitVec 32) ValueCell!3023)) (size!8412 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17049)

(declare-fun mapDefault!11484 () ValueCell!3023)

(assert (=> b!332033 (= condMapEmpty!11484 (= (arr!8059 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3023)) mapDefault!11484)))))

(declare-fun b!332034 () Bool)

(declare-fun e!203859 () Bool)

(declare-fun tp_is_empty!6733 () Bool)

(assert (=> b!332034 (= e!203859 tp_is_empty!6733)))

(declare-fun b!332035 () Bool)

(declare-fun res!182938 () Bool)

(assert (=> b!332035 (=> (not res!182938) (not e!203860))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17047 (_ BitVec 32)) Bool)

(assert (=> b!332035 (= res!182938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332036 () Bool)

(declare-fun res!182937 () Bool)

(assert (=> b!332036 (=> (not res!182937) (not e!203860))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332036 (= res!182937 (and (= (size!8412 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8411 _keys!1895) (size!8412 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332037 () Bool)

(assert (=> b!332037 (= e!203856 tp_is_empty!6733)))

(declare-fun res!182939 () Bool)

(assert (=> start!33466 (=> (not res!182939) (not e!203860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33466 (= res!182939 (validMask!0 mask!2385))))

(assert (=> start!33466 e!203860))

(assert (=> start!33466 true))

(declare-fun array_inv!6016 (array!17049) Bool)

(assert (=> start!33466 (and (array_inv!6016 _values!1525) e!203857)))

(declare-fun array_inv!6017 (array!17047) Bool)

(assert (=> start!33466 (array_inv!6017 _keys!1895)))

(declare-fun mapNonEmpty!11484 () Bool)

(declare-fun tp!23859 () Bool)

(assert (=> mapNonEmpty!11484 (= mapRes!11484 (and tp!23859 e!203859))))

(declare-fun mapValue!11484 () ValueCell!3023)

(declare-fun mapRest!11484 () (Array (_ BitVec 32) ValueCell!3023))

(declare-fun mapKey!11484 () (_ BitVec 32))

(assert (=> mapNonEmpty!11484 (= (arr!8059 _values!1525) (store mapRest!11484 mapKey!11484 mapValue!11484))))

(declare-fun mapIsEmpty!11484 () Bool)

(assert (=> mapIsEmpty!11484 mapRes!11484))

(assert (= (and start!33466 res!182939) b!332036))

(assert (= (and b!332036 res!182937) b!332035))

(assert (= (and b!332035 res!182938) b!332032))

(assert (= (and b!332033 condMapEmpty!11484) mapIsEmpty!11484))

(assert (= (and b!332033 (not condMapEmpty!11484)) mapNonEmpty!11484))

(get-info :version)

(assert (= (and mapNonEmpty!11484 ((_ is ValueCellFull!3023) mapValue!11484)) b!332034))

(assert (= (and b!332033 ((_ is ValueCellFull!3023) mapDefault!11484)) b!332037))

(assert (= start!33466 b!332033))

(declare-fun m!336143 () Bool)

(assert (=> b!332032 m!336143))

(declare-fun m!336145 () Bool)

(assert (=> b!332035 m!336145))

(declare-fun m!336147 () Bool)

(assert (=> start!33466 m!336147))

(declare-fun m!336149 () Bool)

(assert (=> start!33466 m!336149))

(declare-fun m!336151 () Bool)

(assert (=> start!33466 m!336151))

(declare-fun m!336153 () Bool)

(assert (=> mapNonEmpty!11484 m!336153))

(check-sat (not b!332032) (not b!332035) tp_is_empty!6733 (not mapNonEmpty!11484) (not start!33466))
(check-sat)
