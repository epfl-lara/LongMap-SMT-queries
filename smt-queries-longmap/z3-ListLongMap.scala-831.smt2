; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20086 () Bool)

(assert start!20086)

(declare-fun b_free!4741 () Bool)

(declare-fun b_next!4741 () Bool)

(assert (=> start!20086 (= b_free!4741 (not b_next!4741))))

(declare-fun tp!17254 () Bool)

(declare-fun b_and!11501 () Bool)

(assert (=> start!20086 (= tp!17254 b_and!11501)))

(declare-fun b!196711 () Bool)

(declare-fun res!92868 () Bool)

(declare-fun e!129561 () Bool)

(assert (=> b!196711 (=> (not res!92868) (not e!129561))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196711 (= res!92868 (validKeyInArray!0 k0!843))))

(declare-fun b!196712 () Bool)

(declare-fun res!92870 () Bool)

(assert (=> b!196712 (=> (not res!92870) (not e!129561))))

(declare-datatypes ((array!8439 0))(
  ( (array!8440 (arr!3970 (Array (_ BitVec 32) (_ BitVec 64))) (size!4295 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8439)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5777 0))(
  ( (V!5778 (val!2343 Int)) )
))
(declare-datatypes ((ValueCell!1955 0))(
  ( (ValueCellFull!1955 (v!4314 V!5777)) (EmptyCell!1955) )
))
(declare-datatypes ((array!8441 0))(
  ( (array!8442 (arr!3971 (Array (_ BitVec 32) ValueCell!1955)) (size!4296 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8441)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196712 (= res!92870 (and (= (size!4296 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4295 _keys!825) (size!4296 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196713 () Bool)

(declare-fun res!92872 () Bool)

(assert (=> b!196713 (=> (not res!92872) (not e!129561))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196713 (= res!92872 (= (select (arr!3970 _keys!825) i!601) k0!843))))

(declare-fun b!196714 () Bool)

(declare-fun e!129560 () Bool)

(declare-fun tp_is_empty!4597 () Bool)

(assert (=> b!196714 (= e!129560 tp_is_empty!4597)))

(declare-fun mapNonEmpty!7964 () Bool)

(declare-fun mapRes!7964 () Bool)

(declare-fun tp!17255 () Bool)

(assert (=> mapNonEmpty!7964 (= mapRes!7964 (and tp!17255 e!129560))))

(declare-fun mapValue!7964 () ValueCell!1955)

(declare-fun mapRest!7964 () (Array (_ BitVec 32) ValueCell!1955))

(declare-fun mapKey!7964 () (_ BitVec 32))

(assert (=> mapNonEmpty!7964 (= (arr!3971 _values!649) (store mapRest!7964 mapKey!7964 mapValue!7964))))

(declare-fun res!92869 () Bool)

(assert (=> start!20086 (=> (not res!92869) (not e!129561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20086 (= res!92869 (validMask!0 mask!1149))))

(assert (=> start!20086 e!129561))

(declare-fun e!129562 () Bool)

(declare-fun array_inv!2577 (array!8441) Bool)

(assert (=> start!20086 (and (array_inv!2577 _values!649) e!129562)))

(assert (=> start!20086 true))

(assert (=> start!20086 tp_is_empty!4597))

(declare-fun array_inv!2578 (array!8439) Bool)

(assert (=> start!20086 (array_inv!2578 _keys!825)))

(assert (=> start!20086 tp!17254))

(declare-fun b!196715 () Bool)

(assert (=> b!196715 (= e!129561 false)))

(declare-fun zeroValue!615 () V!5777)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5777)

(declare-datatypes ((tuple2!3514 0))(
  ( (tuple2!3515 (_1!1768 (_ BitVec 64)) (_2!1768 V!5777)) )
))
(declare-datatypes ((List!2433 0))(
  ( (Nil!2430) (Cons!2429 (h!3071 tuple2!3514) (t!7356 List!2433)) )
))
(declare-datatypes ((ListLongMap!2429 0))(
  ( (ListLongMap!2430 (toList!1230 List!2433)) )
))
(declare-fun lt!97700 () ListLongMap!2429)

(declare-fun getCurrentListMapNoExtraKeys!220 (array!8439 array!8441 (_ BitVec 32) (_ BitVec 32) V!5777 V!5777 (_ BitVec 32) Int) ListLongMap!2429)

(assert (=> b!196715 (= lt!97700 (getCurrentListMapNoExtraKeys!220 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196716 () Bool)

(declare-fun res!92871 () Bool)

(assert (=> b!196716 (=> (not res!92871) (not e!129561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8439 (_ BitVec 32)) Bool)

(assert (=> b!196716 (= res!92871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196717 () Bool)

(declare-fun res!92866 () Bool)

(assert (=> b!196717 (=> (not res!92866) (not e!129561))))

(declare-datatypes ((List!2434 0))(
  ( (Nil!2431) (Cons!2430 (h!3072 (_ BitVec 64)) (t!7357 List!2434)) )
))
(declare-fun arrayNoDuplicates!0 (array!8439 (_ BitVec 32) List!2434) Bool)

(assert (=> b!196717 (= res!92866 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2431))))

(declare-fun b!196718 () Bool)

(declare-fun res!92867 () Bool)

(assert (=> b!196718 (=> (not res!92867) (not e!129561))))

(assert (=> b!196718 (= res!92867 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4295 _keys!825))))))

(declare-fun b!196719 () Bool)

(declare-fun e!129563 () Bool)

(assert (=> b!196719 (= e!129563 tp_is_empty!4597)))

(declare-fun b!196720 () Bool)

(assert (=> b!196720 (= e!129562 (and e!129563 mapRes!7964))))

(declare-fun condMapEmpty!7964 () Bool)

(declare-fun mapDefault!7964 () ValueCell!1955)

(assert (=> b!196720 (= condMapEmpty!7964 (= (arr!3971 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1955)) mapDefault!7964)))))

(declare-fun mapIsEmpty!7964 () Bool)

(assert (=> mapIsEmpty!7964 mapRes!7964))

(assert (= (and start!20086 res!92869) b!196712))

(assert (= (and b!196712 res!92870) b!196716))

(assert (= (and b!196716 res!92871) b!196717))

(assert (= (and b!196717 res!92866) b!196718))

(assert (= (and b!196718 res!92867) b!196711))

(assert (= (and b!196711 res!92868) b!196713))

(assert (= (and b!196713 res!92872) b!196715))

(assert (= (and b!196720 condMapEmpty!7964) mapIsEmpty!7964))

(assert (= (and b!196720 (not condMapEmpty!7964)) mapNonEmpty!7964))

(get-info :version)

(assert (= (and mapNonEmpty!7964 ((_ is ValueCellFull!1955) mapValue!7964)) b!196714))

(assert (= (and b!196720 ((_ is ValueCellFull!1955) mapDefault!7964)) b!196719))

(assert (= start!20086 b!196720))

(declare-fun m!224037 () Bool)

(assert (=> b!196717 m!224037))

(declare-fun m!224039 () Bool)

(assert (=> b!196716 m!224039))

(declare-fun m!224041 () Bool)

(assert (=> b!196715 m!224041))

(declare-fun m!224043 () Bool)

(assert (=> b!196713 m!224043))

(declare-fun m!224045 () Bool)

(assert (=> mapNonEmpty!7964 m!224045))

(declare-fun m!224047 () Bool)

(assert (=> start!20086 m!224047))

(declare-fun m!224049 () Bool)

(assert (=> start!20086 m!224049))

(declare-fun m!224051 () Bool)

(assert (=> start!20086 m!224051))

(declare-fun m!224053 () Bool)

(assert (=> b!196711 m!224053))

(check-sat b_and!11501 (not b!196715) (not start!20086) tp_is_empty!4597 (not b!196711) (not b!196717) (not b!196716) (not b_next!4741) (not mapNonEmpty!7964))
(check-sat b_and!11501 (not b_next!4741))
