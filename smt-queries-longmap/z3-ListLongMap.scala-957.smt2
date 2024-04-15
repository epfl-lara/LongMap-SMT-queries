; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20842 () Bool)

(assert start!20842)

(declare-fun b_free!5491 () Bool)

(declare-fun b_next!5491 () Bool)

(assert (=> start!20842 (= b_free!5491 (not b_next!5491))))

(declare-fun tp!19513 () Bool)

(declare-fun b_and!12211 () Bool)

(assert (=> start!20842 (= tp!19513 b_and!12211)))

(declare-fun mapNonEmpty!9098 () Bool)

(declare-fun mapRes!9098 () Bool)

(declare-fun tp!19514 () Bool)

(declare-fun e!136142 () Bool)

(assert (=> mapNonEmpty!9098 (= mapRes!9098 (and tp!19514 e!136142))))

(declare-datatypes ((V!6785 0))(
  ( (V!6786 (val!2721 Int)) )
))
(declare-datatypes ((ValueCell!2333 0))(
  ( (ValueCellFull!2333 (v!4685 V!6785)) (EmptyCell!2333) )
))
(declare-fun mapValue!9098 () ValueCell!2333)

(declare-datatypes ((array!9895 0))(
  ( (array!9896 (arr!4697 (Array (_ BitVec 32) ValueCell!2333)) (size!5023 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9895)

(declare-fun mapRest!9098 () (Array (_ BitVec 32) ValueCell!2333))

(declare-fun mapKey!9098 () (_ BitVec 32))

(assert (=> mapNonEmpty!9098 (= (arr!4697 _values!649) (store mapRest!9098 mapKey!9098 mapValue!9098))))

(declare-fun res!101714 () Bool)

(declare-fun e!136141 () Bool)

(assert (=> start!20842 (=> (not res!101714) (not e!136141))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20842 (= res!101714 (validMask!0 mask!1149))))

(assert (=> start!20842 e!136141))

(declare-fun e!136140 () Bool)

(declare-fun array_inv!3085 (array!9895) Bool)

(assert (=> start!20842 (and (array_inv!3085 _values!649) e!136140)))

(assert (=> start!20842 true))

(declare-fun tp_is_empty!5353 () Bool)

(assert (=> start!20842 tp_is_empty!5353))

(declare-datatypes ((array!9897 0))(
  ( (array!9898 (arr!4698 (Array (_ BitVec 32) (_ BitVec 64))) (size!5024 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9897)

(declare-fun array_inv!3086 (array!9897) Bool)

(assert (=> start!20842 (array_inv!3086 _keys!825)))

(assert (=> start!20842 tp!19513))

(declare-fun b!208883 () Bool)

(declare-fun res!101717 () Bool)

(assert (=> b!208883 (=> (not res!101717) (not e!136141))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!208883 (= res!101717 (and (= (size!5023 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5024 _keys!825) (size!5023 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208884 () Bool)

(assert (=> b!208884 (= e!136142 tp_is_empty!5353)))

(declare-fun b!208885 () Bool)

(declare-fun res!101719 () Bool)

(assert (=> b!208885 (=> (not res!101719) (not e!136141))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208885 (= res!101719 (validKeyInArray!0 k0!843))))

(declare-fun b!208886 () Bool)

(declare-fun e!136143 () Bool)

(assert (=> b!208886 (= e!136143 tp_is_empty!5353)))

(declare-fun b!208887 () Bool)

(declare-fun res!101720 () Bool)

(assert (=> b!208887 (=> (not res!101720) (not e!136141))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208887 (= res!101720 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5024 _keys!825))))))

(declare-fun b!208888 () Bool)

(declare-fun res!101718 () Bool)

(assert (=> b!208888 (=> (not res!101718) (not e!136141))))

(declare-datatypes ((List!3007 0))(
  ( (Nil!3004) (Cons!3003 (h!3645 (_ BitVec 64)) (t!7929 List!3007)) )
))
(declare-fun arrayNoDuplicates!0 (array!9897 (_ BitVec 32) List!3007) Bool)

(assert (=> b!208888 (= res!101718 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3004))))

(declare-fun b!208889 () Bool)

(declare-fun res!101715 () Bool)

(assert (=> b!208889 (=> (not res!101715) (not e!136141))))

(assert (=> b!208889 (= res!101715 (= (select (arr!4698 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!9098 () Bool)

(assert (=> mapIsEmpty!9098 mapRes!9098))

(declare-fun b!208890 () Bool)

(assert (=> b!208890 (= e!136140 (and e!136143 mapRes!9098))))

(declare-fun condMapEmpty!9098 () Bool)

(declare-fun mapDefault!9098 () ValueCell!2333)

(assert (=> b!208890 (= condMapEmpty!9098 (= (arr!4697 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2333)) mapDefault!9098)))))

(declare-fun b!208891 () Bool)

(assert (=> b!208891 (= e!136141 false)))

(declare-fun v!520 () V!6785)

(declare-fun zeroValue!615 () V!6785)

(declare-datatypes ((tuple2!4100 0))(
  ( (tuple2!4101 (_1!2061 (_ BitVec 64)) (_2!2061 V!6785)) )
))
(declare-datatypes ((List!3008 0))(
  ( (Nil!3005) (Cons!3004 (h!3646 tuple2!4100) (t!7930 List!3008)) )
))
(declare-datatypes ((ListLongMap!3003 0))(
  ( (ListLongMap!3004 (toList!1517 List!3008)) )
))
(declare-fun lt!106723 () ListLongMap!3003)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6785)

(declare-fun getCurrentListMapNoExtraKeys!468 (array!9897 array!9895 (_ BitVec 32) (_ BitVec 32) V!6785 V!6785 (_ BitVec 32) Int) ListLongMap!3003)

(assert (=> b!208891 (= lt!106723 (getCurrentListMapNoExtraKeys!468 _keys!825 (array!9896 (store (arr!4697 _values!649) i!601 (ValueCellFull!2333 v!520)) (size!5023 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106724 () ListLongMap!3003)

(assert (=> b!208891 (= lt!106724 (getCurrentListMapNoExtraKeys!468 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208892 () Bool)

(declare-fun res!101716 () Bool)

(assert (=> b!208892 (=> (not res!101716) (not e!136141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9897 (_ BitVec 32)) Bool)

(assert (=> b!208892 (= res!101716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20842 res!101714) b!208883))

(assert (= (and b!208883 res!101717) b!208892))

(assert (= (and b!208892 res!101716) b!208888))

(assert (= (and b!208888 res!101718) b!208887))

(assert (= (and b!208887 res!101720) b!208885))

(assert (= (and b!208885 res!101719) b!208889))

(assert (= (and b!208889 res!101715) b!208891))

(assert (= (and b!208890 condMapEmpty!9098) mapIsEmpty!9098))

(assert (= (and b!208890 (not condMapEmpty!9098)) mapNonEmpty!9098))

(get-info :version)

(assert (= (and mapNonEmpty!9098 ((_ is ValueCellFull!2333) mapValue!9098)) b!208884))

(assert (= (and b!208890 ((_ is ValueCellFull!2333) mapDefault!9098)) b!208886))

(assert (= start!20842 b!208890))

(declare-fun m!235887 () Bool)

(assert (=> b!208889 m!235887))

(declare-fun m!235889 () Bool)

(assert (=> b!208892 m!235889))

(declare-fun m!235891 () Bool)

(assert (=> start!20842 m!235891))

(declare-fun m!235893 () Bool)

(assert (=> start!20842 m!235893))

(declare-fun m!235895 () Bool)

(assert (=> start!20842 m!235895))

(declare-fun m!235897 () Bool)

(assert (=> b!208891 m!235897))

(declare-fun m!235899 () Bool)

(assert (=> b!208891 m!235899))

(declare-fun m!235901 () Bool)

(assert (=> b!208891 m!235901))

(declare-fun m!235903 () Bool)

(assert (=> b!208885 m!235903))

(declare-fun m!235905 () Bool)

(assert (=> mapNonEmpty!9098 m!235905))

(declare-fun m!235907 () Bool)

(assert (=> b!208888 m!235907))

(check-sat b_and!12211 tp_is_empty!5353 (not b!208891) (not b!208885) (not mapNonEmpty!9098) (not start!20842) (not b!208892) (not b_next!5491) (not b!208888))
(check-sat b_and!12211 (not b_next!5491))
