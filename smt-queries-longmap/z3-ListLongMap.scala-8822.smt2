; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107158 () Bool)

(assert start!107158)

(declare-fun b!1270445 () Bool)

(declare-fun e!724188 () Bool)

(assert (=> b!1270445 (= e!724188 false)))

(declare-fun lt!574707 () Bool)

(declare-datatypes ((array!82956 0))(
  ( (array!82957 (arr!40015 (Array (_ BitVec 32) (_ BitVec 64))) (size!40551 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82956)

(declare-datatypes ((List!28489 0))(
  ( (Nil!28486) (Cons!28485 (h!29694 (_ BitVec 64)) (t!42018 List!28489)) )
))
(declare-fun arrayNoDuplicates!0 (array!82956 (_ BitVec 32) List!28489) Bool)

(assert (=> b!1270445 (= lt!574707 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28486))))

(declare-fun b!1270446 () Bool)

(declare-fun e!724185 () Bool)

(declare-fun e!724187 () Bool)

(declare-fun mapRes!50851 () Bool)

(assert (=> b!1270446 (= e!724185 (and e!724187 mapRes!50851))))

(declare-fun condMapEmpty!50851 () Bool)

(declare-datatypes ((V!48989 0))(
  ( (V!48990 (val!16498 Int)) )
))
(declare-datatypes ((ValueCell!15570 0))(
  ( (ValueCellFull!15570 (v!19135 V!48989)) (EmptyCell!15570) )
))
(declare-datatypes ((array!82958 0))(
  ( (array!82959 (arr!40016 (Array (_ BitVec 32) ValueCell!15570)) (size!40552 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82958)

(declare-fun mapDefault!50851 () ValueCell!15570)

(assert (=> b!1270446 (= condMapEmpty!50851 (= (arr!40016 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15570)) mapDefault!50851)))))

(declare-fun res!845416 () Bool)

(assert (=> start!107158 (=> (not res!845416) (not e!724188))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107158 (= res!845416 (validMask!0 mask!1730))))

(assert (=> start!107158 e!724188))

(declare-fun array_inv!30437 (array!82958) Bool)

(assert (=> start!107158 (and (array_inv!30437 _values!1134) e!724185)))

(assert (=> start!107158 true))

(declare-fun array_inv!30438 (array!82956) Bool)

(assert (=> start!107158 (array_inv!30438 _keys!1364)))

(declare-fun b!1270447 () Bool)

(declare-fun res!845415 () Bool)

(assert (=> b!1270447 (=> (not res!845415) (not e!724188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82956 (_ BitVec 32)) Bool)

(assert (=> b!1270447 (= res!845415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270448 () Bool)

(declare-fun tp_is_empty!32847 () Bool)

(assert (=> b!1270448 (= e!724187 tp_is_empty!32847)))

(declare-fun b!1270449 () Bool)

(declare-fun res!845417 () Bool)

(assert (=> b!1270449 (=> (not res!845417) (not e!724188))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270449 (= res!845417 (and (= (size!40552 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40551 _keys!1364) (size!40552 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50851 () Bool)

(declare-fun tp!97192 () Bool)

(declare-fun e!724184 () Bool)

(assert (=> mapNonEmpty!50851 (= mapRes!50851 (and tp!97192 e!724184))))

(declare-fun mapKey!50851 () (_ BitVec 32))

(declare-fun mapRest!50851 () (Array (_ BitVec 32) ValueCell!15570))

(declare-fun mapValue!50851 () ValueCell!15570)

(assert (=> mapNonEmpty!50851 (= (arr!40016 _values!1134) (store mapRest!50851 mapKey!50851 mapValue!50851))))

(declare-fun b!1270450 () Bool)

(assert (=> b!1270450 (= e!724184 tp_is_empty!32847)))

(declare-fun mapIsEmpty!50851 () Bool)

(assert (=> mapIsEmpty!50851 mapRes!50851))

(assert (= (and start!107158 res!845416) b!1270449))

(assert (= (and b!1270449 res!845417) b!1270447))

(assert (= (and b!1270447 res!845415) b!1270445))

(assert (= (and b!1270446 condMapEmpty!50851) mapIsEmpty!50851))

(assert (= (and b!1270446 (not condMapEmpty!50851)) mapNonEmpty!50851))

(get-info :version)

(assert (= (and mapNonEmpty!50851 ((_ is ValueCellFull!15570) mapValue!50851)) b!1270450))

(assert (= (and b!1270446 ((_ is ValueCellFull!15570) mapDefault!50851)) b!1270448))

(assert (= start!107158 b!1270446))

(declare-fun m!1168727 () Bool)

(assert (=> b!1270445 m!1168727))

(declare-fun m!1168729 () Bool)

(assert (=> start!107158 m!1168729))

(declare-fun m!1168731 () Bool)

(assert (=> start!107158 m!1168731))

(declare-fun m!1168733 () Bool)

(assert (=> start!107158 m!1168733))

(declare-fun m!1168735 () Bool)

(assert (=> b!1270447 m!1168735))

(declare-fun m!1168737 () Bool)

(assert (=> mapNonEmpty!50851 m!1168737))

(check-sat (not b!1270445) (not start!107158) (not b!1270447) (not mapNonEmpty!50851) tp_is_empty!32847)
(check-sat)
