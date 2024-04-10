; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20186 () Bool)

(assert start!20186)

(declare-fun b_free!4845 () Bool)

(declare-fun b_next!4845 () Bool)

(assert (=> start!20186 (= b_free!4845 (not b_next!4845))))

(declare-fun tp!17567 () Bool)

(declare-fun b_and!11591 () Bool)

(assert (=> start!20186 (= tp!17567 b_and!11591)))

(declare-fun mapNonEmpty!8120 () Bool)

(declare-fun mapRes!8120 () Bool)

(declare-fun tp!17566 () Bool)

(declare-fun e!130317 () Bool)

(assert (=> mapNonEmpty!8120 (= mapRes!8120 (and tp!17566 e!130317))))

(declare-datatypes ((V!5915 0))(
  ( (V!5916 (val!2395 Int)) )
))
(declare-datatypes ((ValueCell!2007 0))(
  ( (ValueCellFull!2007 (v!4365 V!5915)) (EmptyCell!2007) )
))
(declare-fun mapRest!8120 () (Array (_ BitVec 32) ValueCell!2007))

(declare-datatypes ((array!8651 0))(
  ( (array!8652 (arr!4076 (Array (_ BitVec 32) ValueCell!2007)) (size!4401 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8651)

(declare-fun mapValue!8120 () ValueCell!2007)

(declare-fun mapKey!8120 () (_ BitVec 32))

(assert (=> mapNonEmpty!8120 (= (arr!4076 _values!649) (store mapRest!8120 mapKey!8120 mapValue!8120))))

(declare-fun b!198224 () Bool)

(declare-fun res!93943 () Bool)

(declare-fun e!130318 () Bool)

(assert (=> b!198224 (=> (not res!93943) (not e!130318))))

(declare-datatypes ((array!8653 0))(
  ( (array!8654 (arr!4077 (Array (_ BitVec 32) (_ BitVec 64))) (size!4402 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8653)

(declare-datatypes ((List!2547 0))(
  ( (Nil!2544) (Cons!2543 (h!3185 (_ BitVec 64)) (t!7478 List!2547)) )
))
(declare-fun arrayNoDuplicates!0 (array!8653 (_ BitVec 32) List!2547) Bool)

(assert (=> b!198224 (= res!93943 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2544))))

(declare-fun res!93942 () Bool)

(assert (=> start!20186 (=> (not res!93942) (not e!130318))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20186 (= res!93942 (validMask!0 mask!1149))))

(assert (=> start!20186 e!130318))

(declare-fun e!130319 () Bool)

(declare-fun array_inv!2665 (array!8651) Bool)

(assert (=> start!20186 (and (array_inv!2665 _values!649) e!130319)))

(assert (=> start!20186 true))

(declare-fun tp_is_empty!4701 () Bool)

(assert (=> start!20186 tp_is_empty!4701))

(declare-fun array_inv!2666 (array!8653) Bool)

(assert (=> start!20186 (array_inv!2666 _keys!825)))

(assert (=> start!20186 tp!17567))

(declare-fun mapIsEmpty!8120 () Bool)

(assert (=> mapIsEmpty!8120 mapRes!8120))

(declare-fun b!198225 () Bool)

(declare-fun res!93940 () Bool)

(assert (=> b!198225 (=> (not res!93940) (not e!130318))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198225 (= res!93940 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4402 _keys!825))))))

(declare-fun b!198226 () Bool)

(declare-fun res!93941 () Bool)

(assert (=> b!198226 (=> (not res!93941) (not e!130318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8653 (_ BitVec 32)) Bool)

(assert (=> b!198226 (= res!93941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198227 () Bool)

(declare-fun e!130315 () Bool)

(assert (=> b!198227 (= e!130319 (and e!130315 mapRes!8120))))

(declare-fun condMapEmpty!8120 () Bool)

(declare-fun mapDefault!8120 () ValueCell!2007)

(assert (=> b!198227 (= condMapEmpty!8120 (= (arr!4076 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2007)) mapDefault!8120)))))

(declare-fun b!198228 () Bool)

(assert (=> b!198228 (= e!130318 false)))

(declare-datatypes ((tuple2!3632 0))(
  ( (tuple2!3633 (_1!1827 (_ BitVec 64)) (_2!1827 V!5915)) )
))
(declare-datatypes ((List!2548 0))(
  ( (Nil!2545) (Cons!2544 (h!3186 tuple2!3632) (t!7479 List!2548)) )
))
(declare-datatypes ((ListLongMap!2545 0))(
  ( (ListLongMap!2546 (toList!1288 List!2548)) )
))
(declare-fun lt!97875 () ListLongMap!2545)

(declare-fun v!520 () V!5915)

(declare-fun zeroValue!615 () V!5915)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5915)

(declare-fun getCurrentListMapNoExtraKeys!253 (array!8653 array!8651 (_ BitVec 32) (_ BitVec 32) V!5915 V!5915 (_ BitVec 32) Int) ListLongMap!2545)

(assert (=> b!198228 (= lt!97875 (getCurrentListMapNoExtraKeys!253 _keys!825 (array!8652 (store (arr!4076 _values!649) i!601 (ValueCellFull!2007 v!520)) (size!4401 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97874 () ListLongMap!2545)

(assert (=> b!198228 (= lt!97874 (getCurrentListMapNoExtraKeys!253 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198229 () Bool)

(declare-fun res!93939 () Bool)

(assert (=> b!198229 (=> (not res!93939) (not e!130318))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!198229 (= res!93939 (= (select (arr!4077 _keys!825) i!601) k0!843))))

(declare-fun b!198230 () Bool)

(declare-fun res!93937 () Bool)

(assert (=> b!198230 (=> (not res!93937) (not e!130318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198230 (= res!93937 (validKeyInArray!0 k0!843))))

(declare-fun b!198231 () Bool)

(assert (=> b!198231 (= e!130317 tp_is_empty!4701)))

(declare-fun b!198232 () Bool)

(declare-fun res!93938 () Bool)

(assert (=> b!198232 (=> (not res!93938) (not e!130318))))

(assert (=> b!198232 (= res!93938 (and (= (size!4401 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4402 _keys!825) (size!4401 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198233 () Bool)

(assert (=> b!198233 (= e!130315 tp_is_empty!4701)))

(assert (= (and start!20186 res!93942) b!198232))

(assert (= (and b!198232 res!93938) b!198226))

(assert (= (and b!198226 res!93941) b!198224))

(assert (= (and b!198224 res!93943) b!198225))

(assert (= (and b!198225 res!93940) b!198230))

(assert (= (and b!198230 res!93937) b!198229))

(assert (= (and b!198229 res!93939) b!198228))

(assert (= (and b!198227 condMapEmpty!8120) mapIsEmpty!8120))

(assert (= (and b!198227 (not condMapEmpty!8120)) mapNonEmpty!8120))

(get-info :version)

(assert (= (and mapNonEmpty!8120 ((_ is ValueCellFull!2007) mapValue!8120)) b!198231))

(assert (= (and b!198227 ((_ is ValueCellFull!2007) mapDefault!8120)) b!198233))

(assert (= start!20186 b!198227))

(declare-fun m!224891 () Bool)

(assert (=> b!198226 m!224891))

(declare-fun m!224893 () Bool)

(assert (=> b!198224 m!224893))

(declare-fun m!224895 () Bool)

(assert (=> start!20186 m!224895))

(declare-fun m!224897 () Bool)

(assert (=> start!20186 m!224897))

(declare-fun m!224899 () Bool)

(assert (=> start!20186 m!224899))

(declare-fun m!224901 () Bool)

(assert (=> mapNonEmpty!8120 m!224901))

(declare-fun m!224903 () Bool)

(assert (=> b!198229 m!224903))

(declare-fun m!224905 () Bool)

(assert (=> b!198228 m!224905))

(declare-fun m!224907 () Bool)

(assert (=> b!198228 m!224907))

(declare-fun m!224909 () Bool)

(assert (=> b!198228 m!224909))

(declare-fun m!224911 () Bool)

(assert (=> b!198230 m!224911))

(check-sat (not b!198226) tp_is_empty!4701 (not b!198224) (not b_next!4845) (not mapNonEmpty!8120) (not b!198230) (not start!20186) b_and!11591 (not b!198228))
(check-sat b_and!11591 (not b_next!4845))
