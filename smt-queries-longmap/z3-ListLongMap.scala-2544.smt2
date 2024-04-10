; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39084 () Bool)

(assert start!39084)

(declare-fun b_free!9351 () Bool)

(declare-fun b_next!9351 () Bool)

(assert (=> start!39084 (= b_free!9351 (not b_next!9351))))

(declare-fun tp!33581 () Bool)

(declare-fun b_and!16737 () Bool)

(assert (=> start!39084 (= tp!33581 b_and!16737)))

(declare-fun b!410502 () Bool)

(declare-fun e!246036 () Bool)

(assert (=> b!410502 (= e!246036 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15109 0))(
  ( (V!15110 (val!5296 Int)) )
))
(declare-fun minValue!515 () V!15109)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!24875 0))(
  ( (array!24876 (arr!11887 (Array (_ BitVec 32) (_ BitVec 64))) (size!12239 (_ BitVec 32))) )
))
(declare-fun lt!189095 () array!24875)

(declare-datatypes ((ValueCell!4908 0))(
  ( (ValueCellFull!4908 (v!7543 V!15109)) (EmptyCell!4908) )
))
(declare-datatypes ((array!24877 0))(
  ( (array!24878 (arr!11888 (Array (_ BitVec 32) ValueCell!4908)) (size!12240 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24877)

(declare-fun zeroValue!515 () V!15109)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!6868 0))(
  ( (tuple2!6869 (_1!3445 (_ BitVec 64)) (_2!3445 V!15109)) )
))
(declare-datatypes ((List!6893 0))(
  ( (Nil!6890) (Cons!6889 (h!7745 tuple2!6868) (t!12067 List!6893)) )
))
(declare-datatypes ((ListLongMap!5781 0))(
  ( (ListLongMap!5782 (toList!2906 List!6893)) )
))
(declare-fun lt!189094 () ListLongMap!5781)

(declare-fun v!412 () V!15109)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1114 (array!24875 array!24877 (_ BitVec 32) (_ BitVec 32) V!15109 V!15109 (_ BitVec 32) Int) ListLongMap!5781)

(assert (=> b!410502 (= lt!189094 (getCurrentListMapNoExtraKeys!1114 lt!189095 (array!24878 (store (arr!11888 _values!549) i!563 (ValueCellFull!4908 v!412)) (size!12240 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189093 () ListLongMap!5781)

(declare-fun _keys!709 () array!24875)

(assert (=> b!410502 (= lt!189093 (getCurrentListMapNoExtraKeys!1114 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410503 () Bool)

(declare-fun e!246032 () Bool)

(assert (=> b!410503 (= e!246032 e!246036)))

(declare-fun res!237948 () Bool)

(assert (=> b!410503 (=> (not res!237948) (not e!246036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24875 (_ BitVec 32)) Bool)

(assert (=> b!410503 (= res!237948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189095 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!410503 (= lt!189095 (array!24876 (store (arr!11887 _keys!709) i!563 k0!794) (size!12239 _keys!709)))))

(declare-fun mapIsEmpty!17376 () Bool)

(declare-fun mapRes!17376 () Bool)

(assert (=> mapIsEmpty!17376 mapRes!17376))

(declare-fun b!410504 () Bool)

(declare-fun res!237949 () Bool)

(assert (=> b!410504 (=> (not res!237949) (not e!246032))))

(assert (=> b!410504 (= res!237949 (or (= (select (arr!11887 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11887 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410505 () Bool)

(declare-fun res!237951 () Bool)

(assert (=> b!410505 (=> (not res!237951) (not e!246036))))

(assert (=> b!410505 (= res!237951 (bvsle from!863 i!563))))

(declare-fun b!410506 () Bool)

(declare-fun res!237950 () Bool)

(assert (=> b!410506 (=> (not res!237950) (not e!246032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410506 (= res!237950 (validKeyInArray!0 k0!794))))

(declare-fun b!410507 () Bool)

(declare-fun res!237943 () Bool)

(assert (=> b!410507 (=> (not res!237943) (not e!246032))))

(declare-datatypes ((List!6894 0))(
  ( (Nil!6891) (Cons!6890 (h!7746 (_ BitVec 64)) (t!12068 List!6894)) )
))
(declare-fun arrayNoDuplicates!0 (array!24875 (_ BitVec 32) List!6894) Bool)

(assert (=> b!410507 (= res!237943 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6891))))

(declare-fun b!410508 () Bool)

(declare-fun res!237944 () Bool)

(assert (=> b!410508 (=> (not res!237944) (not e!246032))))

(assert (=> b!410508 (= res!237944 (and (= (size!12240 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12239 _keys!709) (size!12240 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410509 () Bool)

(declare-fun res!237942 () Bool)

(assert (=> b!410509 (=> (not res!237942) (not e!246032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410509 (= res!237942 (validMask!0 mask!1025))))

(declare-fun res!237947 () Bool)

(assert (=> start!39084 (=> (not res!237947) (not e!246032))))

(assert (=> start!39084 (= res!237947 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12239 _keys!709))))))

(assert (=> start!39084 e!246032))

(declare-fun tp_is_empty!10503 () Bool)

(assert (=> start!39084 tp_is_empty!10503))

(assert (=> start!39084 tp!33581))

(assert (=> start!39084 true))

(declare-fun e!246031 () Bool)

(declare-fun array_inv!8676 (array!24877) Bool)

(assert (=> start!39084 (and (array_inv!8676 _values!549) e!246031)))

(declare-fun array_inv!8677 (array!24875) Bool)

(assert (=> start!39084 (array_inv!8677 _keys!709)))

(declare-fun b!410510 () Bool)

(declare-fun e!246035 () Bool)

(assert (=> b!410510 (= e!246035 tp_is_empty!10503)))

(declare-fun b!410511 () Bool)

(declare-fun res!237940 () Bool)

(assert (=> b!410511 (=> (not res!237940) (not e!246032))))

(assert (=> b!410511 (= res!237940 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12239 _keys!709))))))

(declare-fun mapNonEmpty!17376 () Bool)

(declare-fun tp!33582 () Bool)

(assert (=> mapNonEmpty!17376 (= mapRes!17376 (and tp!33582 e!246035))))

(declare-fun mapRest!17376 () (Array (_ BitVec 32) ValueCell!4908))

(declare-fun mapKey!17376 () (_ BitVec 32))

(declare-fun mapValue!17376 () ValueCell!4908)

(assert (=> mapNonEmpty!17376 (= (arr!11888 _values!549) (store mapRest!17376 mapKey!17376 mapValue!17376))))

(declare-fun b!410512 () Bool)

(declare-fun e!246034 () Bool)

(assert (=> b!410512 (= e!246031 (and e!246034 mapRes!17376))))

(declare-fun condMapEmpty!17376 () Bool)

(declare-fun mapDefault!17376 () ValueCell!4908)

(assert (=> b!410512 (= condMapEmpty!17376 (= (arr!11888 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4908)) mapDefault!17376)))))

(declare-fun b!410513 () Bool)

(declare-fun res!237941 () Bool)

(assert (=> b!410513 (=> (not res!237941) (not e!246032))))

(declare-fun arrayContainsKey!0 (array!24875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410513 (= res!237941 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410514 () Bool)

(declare-fun res!237945 () Bool)

(assert (=> b!410514 (=> (not res!237945) (not e!246036))))

(assert (=> b!410514 (= res!237945 (arrayNoDuplicates!0 lt!189095 #b00000000000000000000000000000000 Nil!6891))))

(declare-fun b!410515 () Bool)

(declare-fun res!237946 () Bool)

(assert (=> b!410515 (=> (not res!237946) (not e!246032))))

(assert (=> b!410515 (= res!237946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410516 () Bool)

(assert (=> b!410516 (= e!246034 tp_is_empty!10503)))

(assert (= (and start!39084 res!237947) b!410509))

(assert (= (and b!410509 res!237942) b!410508))

(assert (= (and b!410508 res!237944) b!410515))

(assert (= (and b!410515 res!237946) b!410507))

(assert (= (and b!410507 res!237943) b!410511))

(assert (= (and b!410511 res!237940) b!410506))

(assert (= (and b!410506 res!237950) b!410504))

(assert (= (and b!410504 res!237949) b!410513))

(assert (= (and b!410513 res!237941) b!410503))

(assert (= (and b!410503 res!237948) b!410514))

(assert (= (and b!410514 res!237945) b!410505))

(assert (= (and b!410505 res!237951) b!410502))

(assert (= (and b!410512 condMapEmpty!17376) mapIsEmpty!17376))

(assert (= (and b!410512 (not condMapEmpty!17376)) mapNonEmpty!17376))

(get-info :version)

(assert (= (and mapNonEmpty!17376 ((_ is ValueCellFull!4908) mapValue!17376)) b!410510))

(assert (= (and b!410512 ((_ is ValueCellFull!4908) mapDefault!17376)) b!410516))

(assert (= start!39084 b!410512))

(declare-fun m!400963 () Bool)

(assert (=> b!410504 m!400963))

(declare-fun m!400965 () Bool)

(assert (=> start!39084 m!400965))

(declare-fun m!400967 () Bool)

(assert (=> start!39084 m!400967))

(declare-fun m!400969 () Bool)

(assert (=> b!410513 m!400969))

(declare-fun m!400971 () Bool)

(assert (=> b!410514 m!400971))

(declare-fun m!400973 () Bool)

(assert (=> mapNonEmpty!17376 m!400973))

(declare-fun m!400975 () Bool)

(assert (=> b!410502 m!400975))

(declare-fun m!400977 () Bool)

(assert (=> b!410502 m!400977))

(declare-fun m!400979 () Bool)

(assert (=> b!410502 m!400979))

(declare-fun m!400981 () Bool)

(assert (=> b!410506 m!400981))

(declare-fun m!400983 () Bool)

(assert (=> b!410507 m!400983))

(declare-fun m!400985 () Bool)

(assert (=> b!410515 m!400985))

(declare-fun m!400987 () Bool)

(assert (=> b!410503 m!400987))

(declare-fun m!400989 () Bool)

(assert (=> b!410503 m!400989))

(declare-fun m!400991 () Bool)

(assert (=> b!410509 m!400991))

(check-sat (not b!410507) (not start!39084) (not b!410503) (not b!410514) b_and!16737 (not b!410515) (not b_next!9351) (not b!410509) (not b!410506) (not b!410502) (not mapNonEmpty!17376) tp_is_empty!10503 (not b!410513))
(check-sat b_and!16737 (not b_next!9351))
