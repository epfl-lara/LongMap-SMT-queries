; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20792 () Bool)

(assert start!20792)

(declare-fun b_free!5445 () Bool)

(declare-fun b_next!5445 () Bool)

(assert (=> start!20792 (= b_free!5445 (not b_next!5445))))

(declare-fun tp!19376 () Bool)

(declare-fun b_and!12191 () Bool)

(assert (=> start!20792 (= tp!19376 b_and!12191)))

(declare-fun b!208340 () Bool)

(declare-fun res!101328 () Bool)

(declare-fun e!135896 () Bool)

(assert (=> b!208340 (=> (not res!101328) (not e!135896))))

(declare-datatypes ((array!9817 0))(
  ( (array!9818 (arr!4659 (Array (_ BitVec 32) (_ BitVec 64))) (size!4984 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9817)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9817 (_ BitVec 32)) Bool)

(assert (=> b!208340 (= res!101328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!9029 () Bool)

(declare-fun mapRes!9029 () Bool)

(assert (=> mapIsEmpty!9029 mapRes!9029))

(declare-fun b!208341 () Bool)

(declare-fun res!101332 () Bool)

(assert (=> b!208341 (=> (not res!101332) (not e!135896))))

(declare-datatypes ((List!2984 0))(
  ( (Nil!2981) (Cons!2980 (h!3622 (_ BitVec 64)) (t!7915 List!2984)) )
))
(declare-fun arrayNoDuplicates!0 (array!9817 (_ BitVec 32) List!2984) Bool)

(assert (=> b!208341 (= res!101332 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2981))))

(declare-fun b!208342 () Bool)

(declare-fun e!135898 () Bool)

(declare-fun tp_is_empty!5307 () Bool)

(assert (=> b!208342 (= e!135898 tp_is_empty!5307)))

(declare-fun b!208343 () Bool)

(assert (=> b!208343 (= e!135896 false)))

(declare-datatypes ((V!6723 0))(
  ( (V!6724 (val!2698 Int)) )
))
(declare-datatypes ((tuple2!4088 0))(
  ( (tuple2!4089 (_1!2055 (_ BitVec 64)) (_2!2055 V!6723)) )
))
(declare-datatypes ((List!2985 0))(
  ( (Nil!2982) (Cons!2981 (h!3623 tuple2!4088) (t!7916 List!2985)) )
))
(declare-datatypes ((ListLongMap!3001 0))(
  ( (ListLongMap!3002 (toList!1516 List!2985)) )
))
(declare-fun lt!106767 () ListLongMap!3001)

(declare-datatypes ((ValueCell!2310 0))(
  ( (ValueCellFull!2310 (v!4668 V!6723)) (EmptyCell!2310) )
))
(declare-datatypes ((array!9819 0))(
  ( (array!9820 (arr!4660 (Array (_ BitVec 32) ValueCell!2310)) (size!4985 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9819)

(declare-fun v!520 () V!6723)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6723)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6723)

(declare-fun getCurrentListMapNoExtraKeys!457 (array!9817 array!9819 (_ BitVec 32) (_ BitVec 32) V!6723 V!6723 (_ BitVec 32) Int) ListLongMap!3001)

(assert (=> b!208343 (= lt!106767 (getCurrentListMapNoExtraKeys!457 _keys!825 (array!9820 (store (arr!4660 _values!649) i!601 (ValueCellFull!2310 v!520)) (size!4985 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106766 () ListLongMap!3001)

(assert (=> b!208343 (= lt!106766 (getCurrentListMapNoExtraKeys!457 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208344 () Bool)

(declare-fun res!101331 () Bool)

(assert (=> b!208344 (=> (not res!101331) (not e!135896))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208344 (= res!101331 (validKeyInArray!0 k0!843))))

(declare-fun b!208345 () Bool)

(declare-fun res!101326 () Bool)

(assert (=> b!208345 (=> (not res!101326) (not e!135896))))

(assert (=> b!208345 (= res!101326 (and (= (size!4985 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4984 _keys!825) (size!4985 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!101329 () Bool)

(assert (=> start!20792 (=> (not res!101329) (not e!135896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20792 (= res!101329 (validMask!0 mask!1149))))

(assert (=> start!20792 e!135896))

(declare-fun e!135895 () Bool)

(declare-fun array_inv!3089 (array!9819) Bool)

(assert (=> start!20792 (and (array_inv!3089 _values!649) e!135895)))

(assert (=> start!20792 true))

(assert (=> start!20792 tp_is_empty!5307))

(declare-fun array_inv!3090 (array!9817) Bool)

(assert (=> start!20792 (array_inv!3090 _keys!825)))

(assert (=> start!20792 tp!19376))

(declare-fun b!208346 () Bool)

(declare-fun res!101327 () Bool)

(assert (=> b!208346 (=> (not res!101327) (not e!135896))))

(assert (=> b!208346 (= res!101327 (= (select (arr!4659 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!9029 () Bool)

(declare-fun tp!19375 () Bool)

(assert (=> mapNonEmpty!9029 (= mapRes!9029 (and tp!19375 e!135898))))

(declare-fun mapRest!9029 () (Array (_ BitVec 32) ValueCell!2310))

(declare-fun mapKey!9029 () (_ BitVec 32))

(declare-fun mapValue!9029 () ValueCell!2310)

(assert (=> mapNonEmpty!9029 (= (arr!4660 _values!649) (store mapRest!9029 mapKey!9029 mapValue!9029))))

(declare-fun b!208347 () Bool)

(declare-fun e!135897 () Bool)

(assert (=> b!208347 (= e!135895 (and e!135897 mapRes!9029))))

(declare-fun condMapEmpty!9029 () Bool)

(declare-fun mapDefault!9029 () ValueCell!2310)

(assert (=> b!208347 (= condMapEmpty!9029 (= (arr!4660 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2310)) mapDefault!9029)))))

(declare-fun b!208348 () Bool)

(declare-fun res!101330 () Bool)

(assert (=> b!208348 (=> (not res!101330) (not e!135896))))

(assert (=> b!208348 (= res!101330 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4984 _keys!825))))))

(declare-fun b!208349 () Bool)

(assert (=> b!208349 (= e!135897 tp_is_empty!5307)))

(assert (= (and start!20792 res!101329) b!208345))

(assert (= (and b!208345 res!101326) b!208340))

(assert (= (and b!208340 res!101328) b!208341))

(assert (= (and b!208341 res!101332) b!208348))

(assert (= (and b!208348 res!101330) b!208344))

(assert (= (and b!208344 res!101331) b!208346))

(assert (= (and b!208346 res!101327) b!208343))

(assert (= (and b!208347 condMapEmpty!9029) mapIsEmpty!9029))

(assert (= (and b!208347 (not condMapEmpty!9029)) mapNonEmpty!9029))

(get-info :version)

(assert (= (and mapNonEmpty!9029 ((_ is ValueCellFull!2310) mapValue!9029)) b!208342))

(assert (= (and b!208347 ((_ is ValueCellFull!2310) mapDefault!9029)) b!208349))

(assert (= start!20792 b!208347))

(declare-fun m!235997 () Bool)

(assert (=> b!208346 m!235997))

(declare-fun m!235999 () Bool)

(assert (=> b!208340 m!235999))

(declare-fun m!236001 () Bool)

(assert (=> mapNonEmpty!9029 m!236001))

(declare-fun m!236003 () Bool)

(assert (=> start!20792 m!236003))

(declare-fun m!236005 () Bool)

(assert (=> start!20792 m!236005))

(declare-fun m!236007 () Bool)

(assert (=> start!20792 m!236007))

(declare-fun m!236009 () Bool)

(assert (=> b!208343 m!236009))

(declare-fun m!236011 () Bool)

(assert (=> b!208343 m!236011))

(declare-fun m!236013 () Bool)

(assert (=> b!208343 m!236013))

(declare-fun m!236015 () Bool)

(assert (=> b!208341 m!236015))

(declare-fun m!236017 () Bool)

(assert (=> b!208344 m!236017))

(check-sat tp_is_empty!5307 (not b!208340) (not mapNonEmpty!9029) (not start!20792) b_and!12191 (not b!208344) (not b!208341) (not b_next!5445) (not b!208343))
(check-sat b_and!12191 (not b_next!5445))
