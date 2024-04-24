; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33454 () Bool)

(assert start!33454)

(declare-fun b!332146 () Bool)

(declare-fun e!203912 () Bool)

(declare-fun tp_is_empty!6721 () Bool)

(assert (=> b!332146 (= e!203912 tp_is_empty!6721)))

(declare-fun b!332147 () Bool)

(declare-fun res!183010 () Bool)

(declare-fun e!203910 () Bool)

(assert (=> b!332147 (=> (not res!183010) (not e!203910))))

(declare-datatypes ((array!17038 0))(
  ( (array!17039 (arr!8053 (Array (_ BitVec 32) (_ BitVec 64))) (size!8405 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17038)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17038 (_ BitVec 32)) Bool)

(assert (=> b!332147 (= res!183010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!183009 () Bool)

(assert (=> start!33454 (=> (not res!183009) (not e!203910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33454 (= res!183009 (validMask!0 mask!2385))))

(assert (=> start!33454 e!203910))

(assert (=> start!33454 true))

(declare-datatypes ((V!9939 0))(
  ( (V!9940 (val!3405 Int)) )
))
(declare-datatypes ((ValueCell!3017 0))(
  ( (ValueCellFull!3017 (v!5565 V!9939)) (EmptyCell!3017) )
))
(declare-datatypes ((array!17040 0))(
  ( (array!17041 (arr!8054 (Array (_ BitVec 32) ValueCell!3017)) (size!8406 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17040)

(declare-fun e!203908 () Bool)

(declare-fun array_inv!5988 (array!17040) Bool)

(assert (=> start!33454 (and (array_inv!5988 _values!1525) e!203908)))

(declare-fun array_inv!5989 (array!17038) Bool)

(assert (=> start!33454 (array_inv!5989 _keys!1895)))

(declare-fun mapNonEmpty!11466 () Bool)

(declare-fun mapRes!11466 () Bool)

(declare-fun tp!23841 () Bool)

(assert (=> mapNonEmpty!11466 (= mapRes!11466 (and tp!23841 e!203912))))

(declare-fun mapKey!11466 () (_ BitVec 32))

(declare-fun mapValue!11466 () ValueCell!3017)

(declare-fun mapRest!11466 () (Array (_ BitVec 32) ValueCell!3017))

(assert (=> mapNonEmpty!11466 (= (arr!8054 _values!1525) (store mapRest!11466 mapKey!11466 mapValue!11466))))

(declare-fun b!332148 () Bool)

(declare-fun res!183011 () Bool)

(assert (=> b!332148 (=> (not res!183011) (not e!203910))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332148 (= res!183011 (and (= (size!8406 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8405 _keys!1895) (size!8406 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332149 () Bool)

(assert (=> b!332149 (= e!203910 false)))

(declare-fun lt!158995 () Bool)

(declare-datatypes ((List!4499 0))(
  ( (Nil!4496) (Cons!4495 (h!5351 (_ BitVec 64)) (t!9573 List!4499)) )
))
(declare-fun arrayNoDuplicates!0 (array!17038 (_ BitVec 32) List!4499) Bool)

(assert (=> b!332149 (= lt!158995 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4496))))

(declare-fun mapIsEmpty!11466 () Bool)

(assert (=> mapIsEmpty!11466 mapRes!11466))

(declare-fun b!332150 () Bool)

(declare-fun e!203911 () Bool)

(assert (=> b!332150 (= e!203911 tp_is_empty!6721)))

(declare-fun b!332151 () Bool)

(assert (=> b!332151 (= e!203908 (and e!203911 mapRes!11466))))

(declare-fun condMapEmpty!11466 () Bool)

(declare-fun mapDefault!11466 () ValueCell!3017)

(assert (=> b!332151 (= condMapEmpty!11466 (= (arr!8054 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3017)) mapDefault!11466)))))

(assert (= (and start!33454 res!183009) b!332148))

(assert (= (and b!332148 res!183011) b!332147))

(assert (= (and b!332147 res!183010) b!332149))

(assert (= (and b!332151 condMapEmpty!11466) mapIsEmpty!11466))

(assert (= (and b!332151 (not condMapEmpty!11466)) mapNonEmpty!11466))

(get-info :version)

(assert (= (and mapNonEmpty!11466 ((_ is ValueCellFull!3017) mapValue!11466)) b!332146))

(assert (= (and b!332151 ((_ is ValueCellFull!3017) mapDefault!11466)) b!332150))

(assert (= start!33454 b!332151))

(declare-fun m!337025 () Bool)

(assert (=> b!332147 m!337025))

(declare-fun m!337027 () Bool)

(assert (=> start!33454 m!337027))

(declare-fun m!337029 () Bool)

(assert (=> start!33454 m!337029))

(declare-fun m!337031 () Bool)

(assert (=> start!33454 m!337031))

(declare-fun m!337033 () Bool)

(assert (=> mapNonEmpty!11466 m!337033))

(declare-fun m!337035 () Bool)

(assert (=> b!332149 m!337035))

(check-sat (not b!332147) (not start!33454) (not mapNonEmpty!11466) tp_is_empty!6721 (not b!332149))
(check-sat)
