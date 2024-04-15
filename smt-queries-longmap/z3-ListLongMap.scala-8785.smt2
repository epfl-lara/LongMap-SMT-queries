; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106890 () Bool)

(assert start!106890)

(declare-fun b!1267929 () Bool)

(declare-fun e!722380 () Bool)

(declare-fun tp_is_empty!32623 () Bool)

(assert (=> b!1267929 (= e!722380 tp_is_empty!32623)))

(declare-datatypes ((V!48691 0))(
  ( (V!48692 (val!16386 Int)) )
))
(declare-datatypes ((ValueCell!15458 0))(
  ( (ValueCellFull!15458 (v!19021 V!48691)) (EmptyCell!15458) )
))
(declare-datatypes ((array!82439 0))(
  ( (array!82440 (arr!39762 (Array (_ BitVec 32) ValueCell!15458)) (size!40300 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82439)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82441 0))(
  ( (array!82442 (arr!39763 (Array (_ BitVec 32) (_ BitVec 64))) (size!40301 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82441)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun e!722381 () Bool)

(declare-fun b!1267930 () Bool)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1267930 (= e!722381 (and (= (size!40300 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40301 _keys!1364) (size!40300 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011) (not (= (size!40301 _keys!1364) (bvadd #b00000000000000000000000000000001 mask!1730)))))))

(declare-fun b!1267931 () Bool)

(declare-fun e!722382 () Bool)

(declare-fun mapRes!50500 () Bool)

(assert (=> b!1267931 (= e!722382 (and e!722380 mapRes!50500))))

(declare-fun condMapEmpty!50500 () Bool)

(declare-fun mapDefault!50500 () ValueCell!15458)

(assert (=> b!1267931 (= condMapEmpty!50500 (= (arr!39762 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15458)) mapDefault!50500)))))

(declare-fun mapIsEmpty!50500 () Bool)

(assert (=> mapIsEmpty!50500 mapRes!50500))

(declare-fun res!844008 () Bool)

(assert (=> start!106890 (=> (not res!844008) (not e!722381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106890 (= res!844008 (validMask!0 mask!1730))))

(assert (=> start!106890 e!722381))

(declare-fun array_inv!30425 (array!82439) Bool)

(assert (=> start!106890 (and (array_inv!30425 _values!1134) e!722382)))

(assert (=> start!106890 true))

(declare-fun array_inv!30426 (array!82441) Bool)

(assert (=> start!106890 (array_inv!30426 _keys!1364)))

(declare-fun b!1267932 () Bool)

(declare-fun e!722383 () Bool)

(assert (=> b!1267932 (= e!722383 tp_is_empty!32623)))

(declare-fun mapNonEmpty!50500 () Bool)

(declare-fun tp!96680 () Bool)

(assert (=> mapNonEmpty!50500 (= mapRes!50500 (and tp!96680 e!722383))))

(declare-fun mapRest!50500 () (Array (_ BitVec 32) ValueCell!15458))

(declare-fun mapKey!50500 () (_ BitVec 32))

(declare-fun mapValue!50500 () ValueCell!15458)

(assert (=> mapNonEmpty!50500 (= (arr!39762 _values!1134) (store mapRest!50500 mapKey!50500 mapValue!50500))))

(assert (= (and start!106890 res!844008) b!1267930))

(assert (= (and b!1267931 condMapEmpty!50500) mapIsEmpty!50500))

(assert (= (and b!1267931 (not condMapEmpty!50500)) mapNonEmpty!50500))

(get-info :version)

(assert (= (and mapNonEmpty!50500 ((_ is ValueCellFull!15458) mapValue!50500)) b!1267932))

(assert (= (and b!1267931 ((_ is ValueCellFull!15458) mapDefault!50500)) b!1267929))

(assert (= start!106890 b!1267931))

(declare-fun m!1166507 () Bool)

(assert (=> start!106890 m!1166507))

(declare-fun m!1166509 () Bool)

(assert (=> start!106890 m!1166509))

(declare-fun m!1166511 () Bool)

(assert (=> start!106890 m!1166511))

(declare-fun m!1166513 () Bool)

(assert (=> mapNonEmpty!50500 m!1166513))

(check-sat (not start!106890) (not mapNonEmpty!50500) tp_is_empty!32623)
(check-sat)
