; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38948 () Bool)

(assert start!38948)

(declare-fun b!407902 () Bool)

(declare-fun res!235941 () Bool)

(declare-fun e!244905 () Bool)

(assert (=> b!407902 (=> (not res!235941) (not e!244905))))

(declare-datatypes ((array!24640 0))(
  ( (array!24641 (arr!11769 (Array (_ BitVec 32) (_ BitVec 64))) (size!12121 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24640)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14947 0))(
  ( (V!14948 (val!5235 Int)) )
))
(declare-datatypes ((ValueCell!4847 0))(
  ( (ValueCellFull!4847 (v!7483 V!14947)) (EmptyCell!4847) )
))
(declare-datatypes ((array!24642 0))(
  ( (array!24643 (arr!11770 (Array (_ BitVec 32) ValueCell!4847)) (size!12122 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24642)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!407902 (= res!235941 (and (= (size!12122 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12121 _keys!709) (size!12122 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407903 () Bool)

(declare-fun e!244904 () Bool)

(declare-fun e!244906 () Bool)

(declare-fun mapRes!17193 () Bool)

(assert (=> b!407903 (= e!244904 (and e!244906 mapRes!17193))))

(declare-fun condMapEmpty!17193 () Bool)

(declare-fun mapDefault!17193 () ValueCell!4847)

(assert (=> b!407903 (= condMapEmpty!17193 (= (arr!11770 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4847)) mapDefault!17193)))))

(declare-fun res!235940 () Bool)

(assert (=> start!38948 (=> (not res!235940) (not e!244905))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38948 (= res!235940 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12121 _keys!709))))))

(assert (=> start!38948 e!244905))

(assert (=> start!38948 true))

(declare-fun array_inv!8674 (array!24642) Bool)

(assert (=> start!38948 (and (array_inv!8674 _values!549) e!244904)))

(declare-fun array_inv!8675 (array!24640) Bool)

(assert (=> start!38948 (array_inv!8675 _keys!709)))

(declare-fun b!407904 () Bool)

(declare-fun e!244901 () Bool)

(assert (=> b!407904 (= e!244905 e!244901)))

(declare-fun res!235939 () Bool)

(assert (=> b!407904 (=> (not res!235939) (not e!244901))))

(declare-fun lt!188742 () array!24640)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24640 (_ BitVec 32)) Bool)

(assert (=> b!407904 (= res!235939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188742 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407904 (= lt!188742 (array!24641 (store (arr!11769 _keys!709) i!563 k0!794) (size!12121 _keys!709)))))

(declare-fun b!407905 () Bool)

(assert (=> b!407905 (= e!244901 false)))

(declare-fun lt!188741 () Bool)

(declare-datatypes ((List!6701 0))(
  ( (Nil!6698) (Cons!6697 (h!7553 (_ BitVec 64)) (t!11867 List!6701)) )
))
(declare-fun arrayNoDuplicates!0 (array!24640 (_ BitVec 32) List!6701) Bool)

(assert (=> b!407905 (= lt!188741 (arrayNoDuplicates!0 lt!188742 #b00000000000000000000000000000000 Nil!6698))))

(declare-fun b!407906 () Bool)

(declare-fun res!235935 () Bool)

(assert (=> b!407906 (=> (not res!235935) (not e!244905))))

(assert (=> b!407906 (= res!235935 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6698))))

(declare-fun b!407907 () Bool)

(declare-fun res!235944 () Bool)

(assert (=> b!407907 (=> (not res!235944) (not e!244905))))

(declare-fun arrayContainsKey!0 (array!24640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407907 (= res!235944 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407908 () Bool)

(declare-fun res!235942 () Bool)

(assert (=> b!407908 (=> (not res!235942) (not e!244905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407908 (= res!235942 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17193 () Bool)

(assert (=> mapIsEmpty!17193 mapRes!17193))

(declare-fun b!407909 () Bool)

(declare-fun res!235938 () Bool)

(assert (=> b!407909 (=> (not res!235938) (not e!244905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407909 (= res!235938 (validMask!0 mask!1025))))

(declare-fun b!407910 () Bool)

(declare-fun tp_is_empty!10381 () Bool)

(assert (=> b!407910 (= e!244906 tp_is_empty!10381)))

(declare-fun b!407911 () Bool)

(declare-fun res!235937 () Bool)

(assert (=> b!407911 (=> (not res!235937) (not e!244905))))

(assert (=> b!407911 (= res!235937 (or (= (select (arr!11769 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11769 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407912 () Bool)

(declare-fun res!235943 () Bool)

(assert (=> b!407912 (=> (not res!235943) (not e!244905))))

(assert (=> b!407912 (= res!235943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17193 () Bool)

(declare-fun tp!33312 () Bool)

(declare-fun e!244902 () Bool)

(assert (=> mapNonEmpty!17193 (= mapRes!17193 (and tp!33312 e!244902))))

(declare-fun mapKey!17193 () (_ BitVec 32))

(declare-fun mapValue!17193 () ValueCell!4847)

(declare-fun mapRest!17193 () (Array (_ BitVec 32) ValueCell!4847))

(assert (=> mapNonEmpty!17193 (= (arr!11770 _values!549) (store mapRest!17193 mapKey!17193 mapValue!17193))))

(declare-fun b!407913 () Bool)

(assert (=> b!407913 (= e!244902 tp_is_empty!10381)))

(declare-fun b!407914 () Bool)

(declare-fun res!235936 () Bool)

(assert (=> b!407914 (=> (not res!235936) (not e!244905))))

(assert (=> b!407914 (= res!235936 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12121 _keys!709))))))

(assert (= (and start!38948 res!235940) b!407909))

(assert (= (and b!407909 res!235938) b!407902))

(assert (= (and b!407902 res!235941) b!407912))

(assert (= (and b!407912 res!235943) b!407906))

(assert (= (and b!407906 res!235935) b!407914))

(assert (= (and b!407914 res!235936) b!407908))

(assert (= (and b!407908 res!235942) b!407911))

(assert (= (and b!407911 res!235937) b!407907))

(assert (= (and b!407907 res!235944) b!407904))

(assert (= (and b!407904 res!235939) b!407905))

(assert (= (and b!407903 condMapEmpty!17193) mapIsEmpty!17193))

(assert (= (and b!407903 (not condMapEmpty!17193)) mapNonEmpty!17193))

(get-info :version)

(assert (= (and mapNonEmpty!17193 ((_ is ValueCellFull!4847) mapValue!17193)) b!407913))

(assert (= (and b!407903 ((_ is ValueCellFull!4847) mapDefault!17193)) b!407910))

(assert (= start!38948 b!407903))

(declare-fun m!399669 () Bool)

(assert (=> b!407906 m!399669))

(declare-fun m!399671 () Bool)

(assert (=> start!38948 m!399671))

(declare-fun m!399673 () Bool)

(assert (=> start!38948 m!399673))

(declare-fun m!399675 () Bool)

(assert (=> b!407909 m!399675))

(declare-fun m!399677 () Bool)

(assert (=> b!407911 m!399677))

(declare-fun m!399679 () Bool)

(assert (=> b!407908 m!399679))

(declare-fun m!399681 () Bool)

(assert (=> b!407905 m!399681))

(declare-fun m!399683 () Bool)

(assert (=> mapNonEmpty!17193 m!399683))

(declare-fun m!399685 () Bool)

(assert (=> b!407904 m!399685))

(declare-fun m!399687 () Bool)

(assert (=> b!407904 m!399687))

(declare-fun m!399689 () Bool)

(assert (=> b!407912 m!399689))

(declare-fun m!399691 () Bool)

(assert (=> b!407907 m!399691))

(check-sat (not start!38948) (not b!407904) (not b!407905) (not b!407909) (not b!407907) tp_is_empty!10381 (not b!407906) (not b!407908) (not b!407912) (not mapNonEmpty!17193))
(check-sat)
