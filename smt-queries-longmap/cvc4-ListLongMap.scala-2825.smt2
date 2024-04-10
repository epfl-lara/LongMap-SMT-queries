; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40918 () Bool)

(assert start!40918)

(declare-fun b_free!10853 () Bool)

(declare-fun b_next!10853 () Bool)

(assert (=> start!40918 (= b_free!10853 (not b_next!10853))))

(declare-fun tp!38385 () Bool)

(declare-fun b_and!18995 () Bool)

(assert (=> start!40918 (= tp!38385 b_and!18995)))

(declare-fun mapIsEmpty!19927 () Bool)

(declare-fun mapRes!19927 () Bool)

(assert (=> mapIsEmpty!19927 mapRes!19927))

(declare-fun res!271071 () Bool)

(declare-fun e!266031 () Bool)

(assert (=> start!40918 (=> (not res!271071) (not e!266031))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28185 0))(
  ( (array!28186 (arr!13536 (Array (_ BitVec 32) (_ BitVec 64))) (size!13888 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28185)

(assert (=> start!40918 (= res!271071 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13888 _keys!709))))))

(assert (=> start!40918 e!266031))

(declare-fun tp_is_empty!12191 () Bool)

(assert (=> start!40918 tp_is_empty!12191))

(assert (=> start!40918 tp!38385))

(assert (=> start!40918 true))

(declare-datatypes ((V!17359 0))(
  ( (V!17360 (val!6140 Int)) )
))
(declare-datatypes ((ValueCell!5752 0))(
  ( (ValueCellFull!5752 (v!8406 V!17359)) (EmptyCell!5752) )
))
(declare-datatypes ((array!28187 0))(
  ( (array!28188 (arr!13537 (Array (_ BitVec 32) ValueCell!5752)) (size!13889 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28187)

(declare-fun e!266033 () Bool)

(declare-fun array_inv!9806 (array!28187) Bool)

(assert (=> start!40918 (and (array_inv!9806 _values!549) e!266033)))

(declare-fun array_inv!9807 (array!28185) Bool)

(assert (=> start!40918 (array_inv!9807 _keys!709)))

(declare-fun b!454817 () Bool)

(declare-fun e!266034 () Bool)

(assert (=> b!454817 (= e!266031 e!266034)))

(declare-fun res!271074 () Bool)

(assert (=> b!454817 (=> (not res!271074) (not e!266034))))

(declare-fun lt!206211 () array!28185)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28185 (_ BitVec 32)) Bool)

(assert (=> b!454817 (= res!271074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206211 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454817 (= lt!206211 (array!28186 (store (arr!13536 _keys!709) i!563 k!794) (size!13888 _keys!709)))))

(declare-fun b!454818 () Bool)

(declare-fun res!271078 () Bool)

(assert (=> b!454818 (=> (not res!271078) (not e!266031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454818 (= res!271078 (validKeyInArray!0 k!794))))

(declare-fun b!454819 () Bool)

(declare-fun res!271070 () Bool)

(assert (=> b!454819 (=> (not res!271070) (not e!266031))))

(assert (=> b!454819 (= res!271070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454820 () Bool)

(declare-fun res!271077 () Bool)

(assert (=> b!454820 (=> (not res!271077) (not e!266031))))

(declare-datatypes ((List!8152 0))(
  ( (Nil!8149) (Cons!8148 (h!9004 (_ BitVec 64)) (t!13980 List!8152)) )
))
(declare-fun arrayNoDuplicates!0 (array!28185 (_ BitVec 32) List!8152) Bool)

(assert (=> b!454820 (= res!271077 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8149))))

(declare-fun b!454821 () Bool)

(declare-fun res!271068 () Bool)

(assert (=> b!454821 (=> (not res!271068) (not e!266034))))

(assert (=> b!454821 (= res!271068 (arrayNoDuplicates!0 lt!206211 #b00000000000000000000000000000000 Nil!8149))))

(declare-fun b!454822 () Bool)

(declare-fun res!271075 () Bool)

(assert (=> b!454822 (=> (not res!271075) (not e!266031))))

(assert (=> b!454822 (= res!271075 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13888 _keys!709))))))

(declare-fun b!454823 () Bool)

(declare-fun res!271079 () Bool)

(assert (=> b!454823 (=> (not res!271079) (not e!266031))))

(assert (=> b!454823 (= res!271079 (or (= (select (arr!13536 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13536 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454824 () Bool)

(declare-fun res!271073 () Bool)

(assert (=> b!454824 (=> (not res!271073) (not e!266031))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!454824 (= res!271073 (and (= (size!13889 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13888 _keys!709) (size!13889 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19927 () Bool)

(declare-fun tp!38386 () Bool)

(declare-fun e!266035 () Bool)

(assert (=> mapNonEmpty!19927 (= mapRes!19927 (and tp!38386 e!266035))))

(declare-fun mapRest!19927 () (Array (_ BitVec 32) ValueCell!5752))

(declare-fun mapKey!19927 () (_ BitVec 32))

(declare-fun mapValue!19927 () ValueCell!5752)

(assert (=> mapNonEmpty!19927 (= (arr!13537 _values!549) (store mapRest!19927 mapKey!19927 mapValue!19927))))

(declare-fun b!454825 () Bool)

(assert (=> b!454825 (= e!266035 tp_is_empty!12191)))

(declare-fun b!454826 () Bool)

(declare-fun e!266032 () Bool)

(assert (=> b!454826 (= e!266033 (and e!266032 mapRes!19927))))

(declare-fun condMapEmpty!19927 () Bool)

(declare-fun mapDefault!19927 () ValueCell!5752)

